--create new table
create table employees(id serial primary key , last_name varchar(50), first_name varchar(50), experience_year int, email varchar unique );

--insert into
insert into employees(last_name, first_name, experience_year, email)
values('Kanybek uulu', 'Sanjar', 3, 'kanybekuulu@gmail.com'),
      ('Babayeva', 'Asel', 2, 'asel@gmail.com'),
      ('Kuttubekova', 'Cholponay', 5, 'kuttubekova04@gmail.com'),
      ('Kylychbekov', 'Dosmir', 1, 'dosmir812@gmail.com'),
      ('Aigerim', 'Nurlanbek kyzy', 3, 'aigerimnurlanbekkyzy@gmail.com');