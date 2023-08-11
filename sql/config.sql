create database inkscribe;
use inkscribe;
create table users (
	id int primary key auto_increment,
    name varchar(60) not null,
    email varchar(100) unique not null , 
    password varchar(255) not null
);

alter table users auto_increment = 1000;

select * from users;

alter table users add column `profile_image` varchar(255) DEFAULT NULL;
alter table users add column `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP;
alter table users add column `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP;
alter table users add column `bio` longtext;
alter table users add column  `dob` date DEFAULT NULL;

select * from users;
truncate users;


use inkscribe;
create table test ( 
	id int primary key auto_increment,
    name varchar(255),
    email varchar(255) unique not null 
);

desc test;

insert into test (name , email ) values ( 'hello' , 'world' );

select * from test;

drop table test;

show tables;


create table if not exists articles( 
	id int primary key auto_increment,
    user_id int not null,
    title varchar(255) not null,
    slug varchar(255) not null unique,
    content text,
    created_at timestamp default current_timestamp,
    view_count int default 0,
    constraint fk_uid foreign key(user_id) references users(id) on delete cascade
);

create table if not exists responses(
  id int primary key auto_increment,
  content tinytext ,
  article_id int not null,
  user_id int not null, 
  created_at timestamp default current_timestamp,
  constraint fk_user_id foreign key (user_id) references users(id) on delete cascade,
  constraint fk_article_id foreign key (article_id) references articles(id) on delete cascade
);

create table articles_type( 
 id int primary key auto_increment, 
 `type` varchar(20) not null default 'any'
 );
 


alter table articles modify column type int;
alter table articles add constraint fk_article_type foreign key (`type`) references articles(`id`) on delete cascade;

create table reactions (
  id int primary key auto_increment,
  type int(1),
  article_id int not null,
  created_at timestamp default current_timestamp,
  constraint fk_reactions_article_id foreign key (article_id) references articles(id) on delete cascade
);

alter table reactions add column user_id int not null;
alter table reactions add constraint fk_reactions_user_id foreign key (user_id) references users(id) on delete cascade ;


desc articles_type; 
desc articles;
desc responses;
desc reactions;


select * from users;
call like_article(1,2);


desc articles_type;
insert into articles_type( type) values
('Politics'),
('Writing'),
('Programming'),
('Data Science'),
('Technology'),
('Machine Learning'),
('ChatGPT'),
('GPT-4'),
('Productivity');
select * from articles_type;


desc articles;

# Creating an article
insert into articles (user_id , title, slug , content, view_count , type) 
values(
 2, 'this is a test article' ,'test-article' , 'hello world !', 1, 1
);
select * from articles;

call like_article(1 , 2);
call increment_article_vc(1);
call update_article_vc(1, 10);


delete from reactions where id = 1;

select count(id) from reactions where user_id = 2 and article_id = 1;


select * from reactions;

desc responses;

# Like an article
call like_article(1 , 2);

# Dislike an article
call dislike_article(1,2);

# Creating a comment on an article
insert into responses(user_id , article_id , content) values(
	2 , 1 , "Nice article"
);

# Get likes count on a specific article
select count(id) from reactions where article_id = 1 and type = 1;

# Get dislikes count on a specific article
select count(id) from reactions where article_id = 1 and type = 0;

# Get article details for anonymous user
call get_article_details(1 , null); 

# Get article details for loginned user
call get_article_details(1 , 2); 

# Get comments on an article
call get_article_comments(1);
