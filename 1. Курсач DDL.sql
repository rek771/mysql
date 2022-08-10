
DROP DATABASE IF EXISTS bit_economica;
CREATE DATABASE bit_economica;

use bit_economica;

-- ������ ���� ������������� (�����, ������������ � ��.)
CREATE TABLE users_type(
id SERIAL PRIMARY KEY,
name VARCHAR(100)
);

INSERT INTO users_type (name)
VALUES ('admin'), ('user');


-- ������ �������, ��������� ��� �������� � ��� �����������
CREATE TABLE regions(
id SERIAL PRIMARY KEY,
name VARCHAR(100)
);

INSERT INTO regions (name)
VALUES ('������'), ('��������');

-- ������ ������ ����������� � ��������
CREATE TABLE cities(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
region_id BIGINT UNSIGNED NOT NULL,
FOREIGN KEY (region_id) REFERENCES regions(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO cities (name,region_id)
VALUES ('������',1), ('�����-���������',1), ('������',2), ('�������',2);

-- ������ ���� �����������
CREATE TABLE manufactory_type(
id SERIAL PRIMARY KEY, 
name VARCHAR(100)
);
INSERT INTO manufactory_type (name)
VALUES ('����� ���'), ('���������'), ('�������'), ('�������� ���������'), ('�������');

-- ������ ���� ���������, ������� ����� ����������� � � ���������� ��������� �����
CREATE TABLE product_type(
id SERIAL PRIMARY KEY, 
name VARCHAR(100),
take_warehouse FLOAT COMMENT '������� �� � �������� �� ������'
);

INSERT INTO product_type (name, take_warehouse)
VALUES ('������ ����',1), ('������ ����',1), ('����������',10), ('��������',20), ('����',0.05), ('�����',0.05), ('����',0.001), ('������',0.01), ('�����',0.1);

-- ������ �����������
CREATE TABLE manufactory_sub_type(
id SERIAL PRIMARY KEY, 
name VARCHAR(100),
manufactory_type_id BIGINT UNSIGNED NOT NULL,
result_product_id BIGINT UNSIGNED NOT NULL,
count_per_worker FLOAT NOT NULL COMMENT '���������� ��������� �� ������ ���������� � ����', 
FOREIGN KEY (manufactory_type_id) REFERENCES manufactory_type(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (result_product_id) REFERENCES product_type(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO manufactory_sub_type (name, manufactory_type_id, result_product_id, count_per_worker)
VALUES ('����� ������ ���',1,1,2), 
('����� ������ ���',1,2,2), 
('����� �����������',2,3,0.4), 
('����� ����������',2,4,0.2), 
('������� (����)',3,5,100), 
('������� (�����)',3,6,100), 
('��������� ���',4,7,1000);

-- ��� ������������ ���������� ����� ���������� ���������� ��� ������������ ������
create table manufactory_product_needed(
id SERIAL PRIMARY KEY,
manufactory_sub_type_id BIGINT UNSIGNED NOT NULL,
product_type_id BIGINT UNSIGNED NOT NULL,
count_product_need FLOAT NOT NULL COMMENT '���������� ��� ������������ 1 ������',
FOREIGN KEY (manufactory_sub_type_id) REFERENCES manufactory_sub_type(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (product_type_id) REFERENCES product_type(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO manufactory_product_needed (manufactory_sub_type_id, product_type_id, count_product_need)
VALUES (1,8,3), 
(1,9,0.5),
(2,8,3),
(3,9,50),
(3,1,4),
(4,9,150),
(4,1,4),
(5,7,1),
(6,7,1.2);

-- ���� �������������� �����
create table specification_type(
id SERIAL PRIMARY KEY,
name VARCHAR(100)
);
INSERT INTO specification_type (name)
VALUES ('�������'),('��������');

-- ������ ������������� ����
CREATE TABLE users(
id SERIAL PRIMARY KEY,
login VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
type_id BIGINT UNSIGNED NOT NULL,
password_hash varchar(100) NOT NULL,
is_deleted bit default 0,
balance  BIGINT NOT NULL, -- �������������� �� ����� ����� ���������� � �������
FOREIGN KEY (type_id) REFERENCES users_type(id) ON UPDATE CASCADE ON DELETE cascade,
INDEX users_login_idx(login), -- ������ �������� ������� �� ���� ������ ������� ������ �� ���
INDEX users_email_idx(email)
);

INSERT INTO users (login,email,type_id,password_hash,balance)
VALUES ('admin', 'admin@biteconomika.ru', 1, '$2y$10$SYCPZJevzViQOfQ4UHpsI.Zq8qtRh3LT7NfO8nMZZySJBy6oepMiS', 1000),
 ('test_user1', 'test_user1@biteconomika.ru', 2, '$2y$10$5Z0Wh4Lw00VsM9LOxTgOoOWFAaUf4OuOgK0pA5FBfqCNb6J944mkm', 1000),
  ('test_user2', 'test_user2@biteconomika.ru', 2, '$2y$10$C5eMC0HGF2fnCX6z9AJHYe.F1PB4grV21Pzaf9FzN0yscBhl63X6C', 1000)
;

-- ������� ��������� ������� ������������ (����� ���������� ��� �� ����������, ��� � �� ���������� ������� � ����� ������ �������) 
CREATE TABLE users_balance(
id SERIAL PRIMARY KEY,
user_id BIGINT UNSIGNED NOT NULL,
amount_change BIGINT UNSIGNED NOT NULL,
type_operation ENUM('increase', 'decrease'),
comment varchar(100),
created_at DATETIME DEFAULT NOW(),
FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE cascade,
INDEX users_balance_type_operation_idx(type_operation)
);

-- �����������. ���������� � �������� � ������ � ����������� � ������������� ����� �� ���� ������� ����� � ����������, ������� ������������ �� ������, � ����� ����������� � �������
CREATE TABLE enterprise(
id SERIAL PRIMARY KEY,
user_id BIGINT UNSIGNED NOT NULL,
city_id BIGINT UNSIGNED NOT NULL,
manufactory_type_id BIGINT UNSIGNED NOT NULL,
max_employees BIGINT UNSIGNED NOT NULL,
warehouse_size BIGINT UNSIGNED NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (city_id) REFERENCES cities(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (manufactory_type_id) REFERENCES manufactory_sub_type(id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- ������ ��� ������������� ��������
CREATE TABLE products(
id SERIAL PRIMARY KEY, 
product_type_id BIGINT UNSIGNED NOT NULL,
enterprise_id BIGINT UNSIGNED NOT NULL, -- ID ������ ��� �� ��������
price BIGINT UNSIGNED NOT NULL,
is_destroyed BIT NOT NULL DEFAULT 0,
FOREIGN KEY (product_type_id) REFERENCES product_type(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (enterprise_id) REFERENCES enterprise(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- ������ �����, ������� �������� �������� � �������� �� ������������
CREATE TABLE peoples(
id SERIAL PRIMARY KEY,
name VARCHAR(100),
life_cycle BIGINT UNSIGNED NOT NULL DEFAULT 80,
life_cycle_reduction BIGINT UNSIGNED NOT NULL DEFAULT 0, -- ������ ������� ������������ �/��� ���������� �������������� ��������� ��������� ����
life_cycle_important_reduction BIGINT UNSIGNED NOT NULL DEFAULT 0, -- ������ ������� ������������ �/��� ���������� �������������� ��������� ��������� ����
is_died BIT DEFAULT 0,
city_id BIGINT unsigned  NOT NULL,
FOREIGN KEY (city_id) REFERENCES cities(id) ON UPDATE CASCADE ON DELETE CASCADE,
INDEX peoples_life_cycle_idx(life_cycle), -- ����� �������������� ������� �� ���������� �����, ������� ��� �� ��������� ������ ������
INDEX peoples_life_cycle_reduction_idx(life_cycle_reduction),
INDEX peoples_life_cycle_important_reduction_idx(life_cycle_important_reduction)
);

-- ������� ������� � ����������� ������
CREATE TABLE peouple_purchases(
id SERIAL PRIMARY KEY,
people_id BIGINT UNSIGNED NOT NULL,
products_id BIGINT UNSIGNED NOT NULL,
enterprise_id BIGINT UNSIGNED NOT NULL,
sale_price BIGINT UNSIGNED NOT NULL,
created_at DATETIME DEFAULT NOW(),
FOREIGN KEY (people_id) REFERENCES peoples(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (products_id) REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (enterprise_id) REFERENCES enterprise(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- ������ ���� �����. ���� ������ - ���� ������� ������ �� ���� �������������
create table people_specification(
id SERIAL PRIMARY KEY,
people_id BIGINT UNSIGNED NOT NULL,
specification_id BIGINT UNSIGNED NOT NULL,
FOREIGN KEY (people_id) REFERENCES peoples(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (specification_id) REFERENCES specification_type(id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- ������ ���������� � ����������� �����������. ����� �������� ������ � ������� �����������.
create table enterprise_workers(
id SERIAL PRIMARY KEY,
enterprise_id BIGINT UNSIGNED NOT NULL,
people_id BIGINT UNSIGNED NOT NULL,
salary BIGINT UNSIGNED NOT NULL,
FOREIGN KEY (enterprise_id) REFERENCES enterprise(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (people_id) REFERENCES peoples(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- �������� �������� ������������. �������������� �� �����������. �� ��� ������ �� ����� ������ ������. ���� ������� �� �������� �� ����������� �� ����� ��������� �������� ����������� ���� �� �����������.
create table people_earnings(
id SERIAL PRIMARY KEY,
people_id BIGINT unsigned NOT NULL,
change_balance FLOAT NOT NULL,
created_at DATETIME DEFAULT NOW(),
FOREIGN KEY (people_id) REFERENCES peoples(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- �������� ������������ ������������. ���� ����������� ���������, �� ������������ �������,���� ���, �� ������������� life_cycle_reduction �� ��������� �����. � �������, ���� ������� �� ���� ������ ��� ��� ��������(����� ��������� ������) ����������, �� ��� ����� �������������� ���� ������� ����. ����� �������� ������ � ������� ����������.
create table people_needs(
id SERIAL PRIMARY KEY,
people_id BIGINT unsigned  NOT NULL,
product_type_id BIGINT unsigned  NOT NULL,
count_need BIGINT unsigned  NOT NULL,
health_important_reduction FLOAT  NOT NULL DEFAULT 0,
health_important_recovery FLOAT  NOT NULL DEFAULT 0,
health_reduction FLOAT  NOT NULL DEFAULT 0, -- �� ����� ��������������
FOREIGN KEY (product_type_id) REFERENCES product_type(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (people_id) REFERENCES peoples(id) ON UPDATE CASCADE ON DELETE CASCADE
);
