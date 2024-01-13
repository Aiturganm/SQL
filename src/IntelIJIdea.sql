--create new table
create table employees(id serial primary key , last_name varchar(50), first_name varchar(50), experience_year int, email varchar unique );

--insert into
insert into employees(last_name, first_name, experience_year, email)
values('Kanybek uulu', 'Sanjar', 3, 'kanybekuulu@gmail.com'),
      ('Babayeva', 'Asel', 2, 'asel@gmail.com'),
      ('Kuttubekova', 'Cholponay', 5, 'kuttubekova04@gmail.com'),
      ('Kylychbekov', 'Dosmir', 1, 'dosmir812@gmail.com'),
      ('Aigerim', 'Nurlanbek kyzy', 3, 'aigerimnurlanbekkyzy@gmail.com');

--create new table
create table offices(id serial primary key, city varchar(50), phone int, postal_code decimal, address varchar(50) not null, office_name varchar, territory varchar);

--drop column
alter table offices drop column territory;

-- insert into
insert into offices(city, phone, postal_code, address, office_name)
values ('Bishkek', 771234194, 221453, 'Junusalieva114', 'Bakay Bank'),
       ('Bishkek', 229123856, 228135, 'Toktonalieva23', 'MBank');


--create new table
create table customers(id serial primary key, name varchar not null, email varchar check ( email like '%@gmail.com%'), address varchar, credit_limit int);

--insert into
insert into customers(name, email, address, credit_limit)
values ('Dastan Kasymbekov', 'kasymbekov@gmail.com', 'Gogolya2', 500000);



--create new table
create table payments(id serial primary key, customer_id int references customers(id), payment_year int);

--rename table's name
alter table payments rename to payment;

--insert into
insert into payment(customer_id, payment_year)
values (1, 3);



--create new table
create table orders(id serial primary key, order_number int, customer_id int references customers(id));

--add column
alter table orders add column office_id int references offices(id);

--insert into
insert into orders(order_number, customer_id, office_id)
values (1, 1, 2);



create table actor(id serial primary key, name varchar not null, last_name varchar not null);
insert into actor(name, last_name)
values ('Mirbek', 'Kubanychbekov'),
       ('Ainur', 'Turgunbaev'),
       ('Sara', 'Jio');

create table language(id serial primary key, language_name varchar);

insert into language(language_name)
values ('English'),
       ('Russian'),
       ('Kyrgyz'),
       ('Italiano');

create table film(id serial primary key, language_id int references language(id), description varchar, film_name varchar not null);

insert into film (language_id, description, film_name)
values (3, 'This film about life in village', 'Mountain'),
       (1, 'About two friends', 'Salted wind');

create table category(id serial primary key, name varchar);

insert into category(name)
values ('Action'),
       ('Animation'),
       ('Classic'),
       ('Comedy'),
       ('Drama');


create table film_category(id serial primary key, film_id int references film(id), category_id int references category(id));
insert into film_category (film_id, category_id)
values (1, 3),
       (2, 5);
