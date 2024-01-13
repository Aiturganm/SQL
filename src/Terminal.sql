Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (16.1)
Type "help" for help.

postgres=# create table users4(id serial primary key, name varchar unique, email varchar not null, followers decimal, follows decimal);
CREATE TABLE
    postgres=# insert into users4(name, email, followers, follows)
    postgres-# values('Aiturgan', 'aiturgan@gmail.com', 317, 219),
    postgres-# ('Jumagul', 'jumagul@gmail.com', 569, 212),
    postgres-# ('Burulay', 'burul@gmail.com', 123, 58);
INSERT 0 3
postgres=# select * from users4;
id |   name   |       email        | followers | follows
----+----------+--------------------+-----------+---------
  1 | Aiturgan | aiturgan@gmail.com |       317 |     219
  2 | Jumagul  | jumagul@gmail.com  |       569 |     212
  3 | Burulay  | burul@gmail.com    |       123 |      58
(3 rows)


postgres=# create table posts(id serial primary key, users_id int references users4(id), published_year int);
ERROR:  relation "posts" already exists
postgres=# create table posts3(id serial primary key, users_id int references users4(id), published_year int);
CREATE TABLE
    postgres=# insert into posts3(users_id, published_year)
    postgres-# values(1, 2023),
    postgres-# (2, 2024),
    postgres-# (3, 2024);
INSERT 0 3
postgres=# select * from  posts3;
id | users_id | published_year
----+----------+----------------
  1 |        1 |           2023
  2 |        2 |           2024
  3 |        3 |           2024
(3 rows)


postgres=# create table comments1(id serial primary key, post_id int references posts3(id), user_name varchar references users4(name), comment_text varchar);
CREATE TABLE
    postgres=# insert into comments1(post_id, user_name, comment_text)
    postgres-# values(2, 'Aiturgan', 'Very good photo!');
INSERT 0 1
postgres=# select * from comments1;
id | post_id | user_name |   comment_text
----+---------+-----------+------------------
  1 |       2 | Aiturgan  | Very good photo!
(1 row)


postgres=# create table likes(id serial primary key, post_id int references posts3(id), user_id int references(id));
ERROR:  syntax error at or near "("
LINE 1: ...t_id int references posts3(id), user_id int references(id));
^
postgres=# create table likes(id serial primary key, post_id int references posts3(id), user_id int references users4(id));
ERROR:  relation "likes" already exists
postgres=# create table likes1(id serial primary key, post_id int references posts3(id), user_id int references users4(id));
CREATE TABLE
    postgres=# insert into likes(post_id, user_id)
    postgres-# values(2, 3),
    postgres-# (2, 1),
    postgres-# (3, 1);
INSERT 0 3
postgres=# select * from likes;
id | user_id | post_id | timestap
----+---------+---------+----------
  1 |       1 |       1 |       11
  2 |       2 |       1 |       16
  3 |       2 |       3 |       19
  4 |       1 |       3 |        3
  5 |       3 |       2 |        9
  6 |       3 |       1 |       12
  7 |       3 |       2 |
  8 |       1 |       2 |
  9 |       1 |       3 |
(9 rows)


postgres=# insert into likes1(post_id, user_id)
postgres-# values(2, 1),
postgres-# (2, 3),
postgres-# (3, 1);
INSERT 0 3
postgres=# select * from likes1;
id | post_id | user_id
----+---------+---------
  1 |       2 |       1
  2 |       2 |       3
  3 |       3 |       1
(3 rows)


postgres=# create table message(id serial primary key, sender_id int references users4(id), receiver_id int references users4(id), message_text varchar, is_read varchar);
CREATE TABLE
    postgres=# insert into message(sender_id, receiver_id, message_text, is_read)
    postgres-# values(1, 2, 'Hello! How are you?', 'readed'),
    postgres-# (2, 1, 'Hello i am fine and you? What are you doing?', 'didnt read');
INSERT 0 2
postgres=# select * from message;
id | sender_id | receiver_id |                 message_text                 |  is_read
----+-----------+-------------+----------------------------------------------+------------
  1 |         1 |           2 | Hello! How are you?                          | readed
  2 |         2 |           1 | Hello i am fine and you? What are you doing? | didnt read
(2 rows)


postgres=# create table tags(id serial primary key, tag_name varchar);
ERROR:  relation "tags" already exists
postgres=# create table tag(id serial primary key, tag_name varchar);
CREATE TABLE
    postgres=# alter table tag alter column tag_name add constraint tag_name not null(tag_name);
ERROR:  syntax error at or near "constraint"
LINE 1: alter table tag alter column tag_name add constraint tag_nam...
                                                  ^
postgres=# alter table tag constraint tag_name not null(tag_name);
ERROR:  syntax error at or near "constraint"
LINE 1: alter table tag constraint tag_name not null(tag_name);
^
postgres=# alter table tag add column users int references users4(id);
ALTER TABLE
    postgres=# select*from tag;
id | tag_name | users
----+----------+-------
(0 rows)


postgres=# insert into tag(tag_name, users)
postgres-# values('Mountains', 1),
postgres-# ('City', 3);
INSERT 0 2
postgres=# select * from tag;
id | tag_name  | users
----+-----------+-------
  1 | Mountains |     1
  2 | City      |     3
(2 rows)


postgres=# create table frienships(id serial primary key, user1_id int references users4(id), users2_id int references users4(id));
CREATE TABLE
    postgres=# insert into friendships(user1_id, users2_id)
    postgres-# values(1, 2),
    postgres-# (2, 3),
    postgres-# (3, 1);
ERROR:  relation "friendships" does not exist
LINE 1: insert into friendships(user1_id, users2_id)
                    ^
postgres=# insert into frienships(user1_id, users2_id)
postgres-# values(1, 2),
postgres-# (2, 3),
postgres-# (3, 1);
INSERT 0 3
postgres=# select * from frienships;
id | user1_id | users2_id
----+----------+-----------
  1 |        1 |         2
  2 |        2 |         3
  3 |        3 |         1
(3 rows)


postgres=# create tables group(id serial primary key, group_name varchar, users_id int references users4(id), description varchar);
ERROR:  syntax error at or near "tables"
LINE 1: create tables group(id serial primary key, group_name varcha...
               ^
postgres=# create table group(id serial primary key, group_name varchar, users_id int references users4(id), description varchar);
ERROR:  syntax error at or near "group"
LINE 1: create table group(id serial primary key, group_name varchar...
                     ^
postgres=# create table groups1(id serial primary key, group_name varchar, users_id int references users4(id), description varchar);
CREATE TABLE
postgres=# insert into group1(group_name, users_id, description)
postgres-# values('Friends', 1, 'Group for friends');
ERROR:  relation "group1" does not exist
LINE 1: insert into group1(group_name, users_id, description)
                    ^
postgres=# insert into groups1(group_name, users_id, description)
postgres-# values('Friends', 1, 'Group for friends');
INSERT 0 1
postgres=# select * from groups1;
 id | group_name | users_id |    description
----+------------+----------+-------------------
  1 | Friends    |        1 | Group for friends
(1 row)


postgres=# insert into groups1(users_id)
postgres-# values(2),
postgres-# (3);
INSERT 0 2
postgres=# select * from groups1;
 id | group_name | users_id |    description
----+------------+----------+-------------------
  1 | Friends    |        1 | Group for friends
  2 |            |        2 |
  3 |            |        3 |
(3 rows)


postgres=# create tables saved_posts(id serial primary key, post_id int references posts3(id), user_that_save_id int references users4(id));
ERROR:  syntax error at or near "tables"
LINE 1: create tables saved_posts(id serial primary key, post_id int...
               ^
postgres=# create table saved_posts(id serial primary key, post_id int references posts3(id), user_that_save_id int references users4(id));
CREATE TABLE
postgres=# insert into seved_post(post_id, user_that_save_id)
postgres-# values(2, 1),
postgres-# (1, 3);
ERROR:  relation "seved_post" does not exist
LINE 1: insert into seved_post(post_id, user_that_save_id)
                    ^
postgres=# insert into saved_post(post_id, user_that_save_id)
postgres-# (1, 3);
ERROR:  syntax error at or near "1"
LINE 2: (1, 3);
         ^
postgres=# insert into seved_post(post_id, user_that_save_id)
postgres-# values(2, 1),
postgres-# (1, 3);
ERROR:  relation "seved_post" does not exist
LINE 1: insert into seved_post(post_id, user_that_save_id)
                    ^
postgres=# insert into saved_post(post_id, user_that_save_id)
postgres-# values(2, 1),
postgres-# (1, 3);
ERROR:  relation "saved_post" does not exist
LINE 1: insert into saved_post(post_id, user_that_save_id)
                    ^
postgres=# insert into seved_posts(post_id, user_that_save_id)
postgres-# values(2, 1),
postgres-# (1, 3);
ERROR:  relation "seved_posts" does not exist
LINE 1: insert into seved_posts(post_id, user_that_save_id)
                    ^
postgres=# insert into saved_posts(post_id, user_that_save_id)
postgres-# values(2, 1),
postgres-# (1, 3);
INSERT 0 2
postgres=# select * from saved_posts;
 id | post_id | user_that_save_id
----+---------+-------------------
  1 |       2 |                 1
  2 |       1 |                 3
(2 rows)


postgres=# create table reels(id serial primary key, published_year int, text varchar, user_id int references users4(id));
CREATE TABLE
postgres=# insert into reels(published_year, text, user_id)
postgres-# values(2023, 'Just enjoiyng the moment', 2),
postgres-# (2024, 'My favorite dishes', 3);
INSERT 0 2
postgres=# select * from reels;
 id | published_year |           text           | user_id
----+----------------+--------------------------+---------
  1 |           2023 | Just enjoiyng the moment |       2
  2 |           2024 | My favorite dishes       |       3
(2 rows)


postgres=#