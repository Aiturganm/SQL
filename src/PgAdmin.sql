create table person(id serial primary key, name varchar, phone_number int, email varchar unique);
insert into person(name, phone_number, email)
values('Aliya', 772397183, 'aliya@gmail.com'),
      ('Asel', 703197658, 'asel@gmail.com');
select * from person;

create table address(id serial primary key, street varchar, postral_code int);
alter table address add column city varchar;
insert into address(city, street, postral_code)
values('Bishkek', 'Ahunbaeva36/4', 238764),
      ('Osh', 'Aitmatov124', 183567),
      ('Bishkek', 'Kievskiy19', 228456),
      ('Bishkek', 'Alamedin34/2', 217459);
select*from address;

create table students7(id serial primary key, student_name varchar not null, average_ball decimal, student_number int, student_email varchar);
alter table students7 add constraint student_email unique(student_email);
select * from students7;

insert into students7(student_name, average_ball, student_number, student_email)
values('Erjan', 4.5, 778915390, 'erjan05@gmail.com'),
      ('Dastan', 5.0, 709346187, 'kasymbekov@gmail.com'),
      ('Ulukbek', 3.9, 505297158, 'muhamadovulukbek@gmail.com'),
      ('Sanjar', 4.7, 505189456, 'kanybekuulu409@gmail.com');
select * from students7;

alter table students7 drop column student_number;
select * from students7;

create table professors(id serial primary key, professor_lection varchar, professor_name varchar not null, salary decimal);
insert into professors(professor_lection, professor_name, salary)
values ('computer science', 'Rysbek Taalaibekov', 45000),
       ('database', 'Kerez Karybalyeava', 53000),
       ('english', 'Apal Kasymbekova', 38000);
select * from professors;

create table book(id serial primary key, book_name varchar, author_id int references person(id));
alter table book add constraint book_name unique(book_name);
alter table book add column page_count int;
insert into book(book_name, author_id, page_count)
values('Ozumdu taptym', 1, 238),
      ('Voity v it', 2, 726),
      ('C# programming language', 2, 891);
select*from book;

create table university(id serial primary key, student_id int references students7(id), professors_id int references professors(id));
alter table university add column address_id int references address(id);
alter table university add column university_name varchar;


insert into university(university_name, student_id, professors_id, address_id)
values('BSU', 4, 1, 1),
      ('KSTU', 2, 2, 1),
      ('Arabaeva', 1, 3, 3);
select*from university;

create table library(id serial primary key, book_id int references book(id), university_id int references university(id), library_name varchar not null);

insert into library(library_name, book_id, university_id)
values('Osmonov', 1, 3),
      ('Bayalinov', 2, 1),
      ('Bayalinov', 3, 2);
select * from library;

create table room(id serial primary key, room_name varchar not null, room_number int);
alter table room add constraint room_number unique(room_number);
alter table room add column tables_count int;

insert into room(room_name, room_number, tables_count)
values('Mathematika', 413, 34),
      ('Phichology', 102, 180),
      ('Programming_room', 306, 56);
select * from room;

create table computers(id serial primary key, brand varchar not null, memory decimal, price decimal);
insert into computers(brand, memory, price)
values('Aser', 256, 52000),
      ('Mac', 512, 78000),
      ('HP', 512, 65000);
select * from computers;

create table computer_club(id serial primary key, club_name varchar, room_id int references room(id), computer_id int references computers(id), student_id int references students7(id));
alter table computer_club add constraint club_name unique(club_name);
insert into computer_club(club_name, room_id, computer_id, student_id)
values('Ilgir', 3, 2, 1);
select * from computer_club;