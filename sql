# DDL - Create
create database store;
create table countries(
    code int primary key ,
    name varchar(20) not null,
    continent_name varchar(20) unique
);

create table users(
    id int primary key ,
    full_name varchar(20),
    email varchar(20) unique ,
    gender char(1) check (gender='M' or gender='F'),
    date_of_birth varchar(15),
    created_at datetime,
    country_code int,
    foreign key (country_code) references countries(code)
);

create table orders(
    id int primary key,
    user_id int,
    status varchar(6) check (status='start' or status='finish'),
    created_at datetime,
    foreign key (user_id) references users(id)
);

create table products(
    id int primary key,
    name varchar(10) not null,
    price int default 0,
    status varchar(10) check (status='valid' or status='expired'),
    created_at datetime
);

create table order_products(
    order_id int,
    product_id int,
    quantity int default 0,
    primary key (order_id, product_id),
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);

#DQL - Select
select * from countries;
select * from users;
select * from orders;
select * from order_products;
select * from products;

# DML - Insert
insert into countries values(1,'Lina','KSA');
insert into users values(1,'Lina Aloqaily','lina@gmail.com','F','1998/12/20',NOW(),1);
insert into orders values(1,1,'start',NOW());
insert into products values(1,'Lina',25,'expired', NOW());
insert into order_products values(1,1,3);

# DML - Update
update countries set name='Ibrahim' where code='1';

# DML - Delete
delete from products where id='1';
