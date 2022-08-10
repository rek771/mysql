use bit_economica;

-- представление, связывающее активные products и product_type
create or replace VIEW active_products AS select pr.*, pt.take_warehouse from products pr 
join product_type pt on pr.product_type_id = pt.id 
where pr.is_destroyed = b'0';

-- Представление, выводящее все балансы пользователей
create or replace VIEW users_balances AS
select u.id, (select sum(ub.amount_change) from users_balance ub where ub.user_id =u.id and ub.type_operation = 'increase')-(select sum(ub.amount_change) from users_balance ub where  ub.user_id =u.id and ub.type_operation = 'decrease') as balance
from users u;

-- проверяем представление users_balances
select * from users_balances;

-- ЗАПРОС Запрос на получение всех предприятий пользователя пользователя под ID = 1 + проверяем и используем представление active_products
SELECT u.id, e.id, mt.name as 'manufactory_type', c.name as 'city', e.max_employees , e.warehouse_size,  
(select count(*) from enterprise_workers ew where ew.enterprise_id=e.id group by e.id) as 'workers_count',
(select sum(ap.take_warehouse) from active_products ap where ap.enterprise_id = e.id) as 'warehouse_busy'
FROM users u 
join enterprise e on e.user_id = u.id
left join cities c on e.city_id = c.id 
left join manufactory_sub_type mt on e.manufactory_type_id = mt.id
where u.id = 1
order by e.max_employees desc -- пример сортировки
;

--  ЗАПРОС получаем выручку всех предприятий пользователя за 2005 год
select e.user_id , sum(pp.sale_price) from enterprise e 
join peouple_purchases pp ON pp.enterprise_id =e.id 
where year(pp.created_at) = 2005
group by e.user_id;

-- ТРИГГЕР Триггер на увеличение баланса сущности  users, если в таблицу users_balance были записаны значения
drop trigger if exists `update_users_balance`;
delimiter //
create TRIGGER `update_users_balance` AFTER INSERT ON `users_balance`
FOR EACH ROW begin
	DECLARE users_balance BIGINT;
	SET users_balance = (select u.balance from users u where u.id = new.user_id);
	if new.type_operation = 'increase' then 
	 	update users set users.balance = users_balance + new.amount_change where users.id = new.user_id;
	elseif new.type_operation = 'decrease' then
	 	update users set users.balance = users_balance - new.amount_change where users.id = new.user_id;
    END IF;
END;
delimiter ;

-- ПРОВЕРКА
select u.balance from users u where u.id = 1; -- проверяем баланс пользователя
insert into	 users_balance (user_id, amount_change, type_operation) values (1, 1000, 'increase'); -- записываем пополнение
select u.balance from users u where u.id = 1; -- проверяем баланс пользователя
insert into	 users_balance (user_id, amount_change, type_operation) values (1, 1000, 'decrease'); -- записываем списание
select u.balance from users u where u.id = 1; -- проверяем баланс пользователя


-- ТРИГГЕР убиваем пользователя если life_cycle_reduction и life_cycle_important_reduction меньше life_cycle
drop trigger if exists `peoples_kill`;
delimiter //
create TRIGGER `peoples_kill` BEFORE UPDATE ON `peoples`
FOR EACH ROW begin
	DECLARE prople_lifetime BIGINT;
	set prople_lifetime = convert(new.life_cycle, signed) - convert(new.life_cycle_reduction, signed) - convert(new.life_cycle_important_reduction, signed);
	if prople_lifetime <= 0 then 
		SET new.is_died = b'1';
	else
		SET new.is_died = b'0';
    END IF;
END;
delimiter ;

-- ПРОВЕРКА
select * from peoples p where p.id = 3; -- Проверяем что пользователь жив
update peoples p set p.life_cycle_reduction = 5000000000000000 where p.id = 3; -- Увеличиваем ухудшающий фактор жизни на предельное значение
select * from peoples p where p.id = 3; -- проверяем, что пользователь мертв


--  ХРАНИМАЯ ПРОЦЕДУРА Интерфейс, показывающий производственную цепочку для выбранного типа производства
delimiter //
DROP PROCEDURE IF EXISTS product_chain//
CREATE PROCEDURE product_chain (IN manufactory_sub_type_id INT)
begin
	
  DECLARE is_end INT DEFAULT 0;
  DECLARE name VARCHAR(100);
  DECLARE count_needed  BIGINT UNSIGNED;
 
  DECLARE products_needed CURSOR FOR select pt.name, mpn.count_product_need FROM manufactory_product_needed mpn join product_type pt on mpn.product_type_id = pt.id where mpn.manufactory_sub_type_id = manufactory_sub_type_id;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;

  OPEN products_needed;

  drop table if exists tempTable1;
  CREATE TEMPORARY TABLE tempTable1(
       name VARCHAR(100),
       count_needed FLOAT
    ) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

  cycle : LOOP
	FETCH products_needed INTO name, count_needed;
	IF is_end THEN LEAVE cycle;
	END IF;
	INSERT INTO tempTable1 VALUES(name, count_needed);
  END LOOP cycle;

  CLOSE products_needed;
 
  select * from tempTable1
  union
  select '↓↓↓','↓↓↓'
  union 
  select pt.name, mst.count_per_worker from manufactory_sub_type mst join product_type pt on mst.result_product_id = pt.id  where mst.id = manufactory_sub_type_id;
END//
delimiter ;

-- ПРОВЕРКА
CALL product_chain(3);

-- ХРАНИМАЯ ПРОЦЕДУРА Максимальное количество продукции, которое может произвести предприятие за день
delimiter //
DROP PROCEDURE IF EXISTS max_produce_per_day//
CREATE PROCEDURE max_produce_per_day (IN enterprise_id INT)
begin
	declare max_employees float;
	declare warehouse_size float;
	declare produce_per_employee float;
	declare max_produce float;
	SET max_employees = (select e.max_employees from enterprise e where e.id = enterprise_id limit 1);
	SET warehouse_size = (select e.warehouse_size from enterprise e where e.id = enterprise_id limit 1);
	SET produce_per_employee = (select mst.count_per_worker from enterprise e join manufactory_sub_type mst on e.manufactory_type_id = mst.id where e.id = enterprise_id limit 1);
	SET max_produce = produce_per_employee * max_employees;
 
	if max_produce > warehouse_size then 
		select warehouse_size;
	else 
		select max_produce;
	end if;

END//
delimiter ;

-- ПРОВЕРКА
CALL max_produce_per_day(1); -- ситуация когда склад не может быть заполнен за день
CALL max_produce_per_day(5); -- ситуация когда склад может быть заполнен за день