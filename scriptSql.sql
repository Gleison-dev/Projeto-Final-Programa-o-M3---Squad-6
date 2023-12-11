create database kani;
use kani;

create table tb_adress(
id int primary key auto_increment,
cep int not null,
street varchar(255),
street_number int,
neighborhood varchar(255),
city varchar(255),
state varchar(255),
country varchar(255),
created_at timestamp default now()
);

create table tb_users(
id int primary key auto_increment,
first_name varchar(255) not null,
last_name varchar(255) not null,
age int not null,
gender int not null,
adress_id int,
parentlist_id int,
email varchar(255),
password varchar(255),
created_at timestamp default now(),
foreign key (adress_id) references tb_adress(id)
);

create table tb_parents(
id int primary key auto_increment,
first_name varchar(255) not null,
last_name varchar(255) not null,
age int not null,
gender int not null,
adress_id int,
email varchar(255),
password varchar(255),
created_at timestamp default now(),
foreign key (adress_id) references tb_adress(id)
);

create table tb_parentlist(
id int primary key auto_increment,
user_id int not null,
parent_id int not null,
created_at timestamp default now(),
foreign key (user_id) references tb_users(id),
foreign key (parent_id) references tb_parents(id)
);

create table tb_teachers(
id int primary key auto_increment,
first_name varchar(255) not null,
last_name varchar(255) not null,
age int not null,
gender int not null,
adress_id int,
email varchar(255),
password varchar(255),
created_at timestamp default now(),
foreign key (adress_id) references tb_adress(id)
);

create table tb_teacherlist(
id int primary key auto_increment,
teacher_id int,
created_at timestamp default now(),
foreign key (teacher_id) references tb_teachers(id)
);

create table tb_userlist(
id int primary key auto_increment,
user_id int not null,
squad_id int,
created_at timestamp default now(),
foreign key (user_id) references tb_users(id)
);

create table tb_squads(
id int primary key auto_increment,
userlist_id int,
created_at timestamp default now(),
foreign key (userlist_id) references tb_userlist(id)
);