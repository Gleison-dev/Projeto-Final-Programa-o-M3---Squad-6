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
gender char(1) not null,
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
gender char(1) not null,
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
gender char(1) not null,
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
created_at timestamp default now(),
foreign key (user_id) references tb_users(id)
);

create table tb_squads(
id int primary key auto_increment,
userlist_id int,
created_at timestamp default now(),
foreign key (userlist_id) references tb_userlist(id)
);

insert into tb_adress (cep, street, street_number, neighborhood, city, state, country) values
('39402094', 'Rua Severiano Pereira de Brito', 206, 'Delfino Magalhães', 'Montes Claros', 'Minas Gerais', 'Brasil'),
('87080125', 'Rua Pioneiro Grigori Parandiuc', 16, 'Residencial Moreschi', 'Maringá', 'Paraná', 'Brasil'),
('04617900', 'Rua Vieira de Morais', 74, 'Campo Belo', 'São Paulo', 'São Paulo', 'Brasil'),
('11714060', 'Rua B', 20, 'Ribeirópolis', 'Praia Grande', 'São Paulo', 'Brasil'),
('79620070', 'Rua Itacil Pereira Martins', 104, 'Santos Dumont', 'Três Lagoas', 'Mato Grosso do Sul', 'Brasil'),
('02955060', 'Rua Maria Luiza', 2, 'Vila Renato', 'São Paulo', 'São Paulo', 'Brasil'),
('26125230', 'Rua Bernardo Saul', 64, 'Jardim Xavantes', 'Belford Roxo', 'Rio de Janeiro', 'Brasil'),
('45606772', 'Rua São João', 304, 'Maria Pinheiro', 'Itabuna', 'Bahia', 'Brasil'),
('65914428', 'Rua da Alegria', 25, 'Residencial Cinco Estrelas', 'Imperatriz', 'Maranhão', 'Brasil'),
('29057620', 'Rua Átila Guimarães', 55, 'Barro Vermelho', 'Vitória', 'Espírito Santo', 'Brasil'),
('18705420', 'Rua Rio Grande do Norte', 659, 'Pinheiro Machado', 'Avaré', 'São Paulo', 'Brasil'),
('74923380', 'Rua Castanheira', '269', 'Jardim dos Buritis', 'Aparecida de Goiânia', 'Goiás', 'Brasil'),
('13341043', 'Alameda dos Jequitibás', 103, 'Colinas do Mosteiro de Itaici', 'Indaiatuba', 'São Paulo', 'Brasil'),
('78717106', 'Rua B', 10, 'Residencial das Orquídeas', 'Rondonópolis', 'Mato Grosso', 'Brasil'),
('44061580', 'Rua Cambaiba', 45, 'Papagaio', 'Feira de Santana', 'Bahia', 'Brasil'),
('83180970', 'Estrada Principal', 640, 'Centro', 'Colônia Malhada', 'Paraná', 'Brasil');


insert into tb_teachers(first_name, last_name, age, gender, adress_id, email, password) values 
('Andreia', 'Gonçalves', 23, 'F', 1, 'andreiateacher@gmail.com', 'dreia3720'),
('Luiz', 'Silva', 25, 'M', 2, 'luizteacher@gmail.com', 'ls462130'),
('Thiago', 'Gomes', 20, 'M', 3,'thiagoteacher@gmail.com', '562030'),
('Juliana', 'Ferreira', 21, 'F', 4, 'julianateacher@gmail.com', 'ju165040'),
('Tiago', 'Cavalcanti', 34, 'M', 5, 'tiago_cavalcanti@gmail.com', 'breno2901'),
('Luiz', 'Silva', 25, 'M', 6, 'luizteacher@gmail.com', 'ls462130'),
('Isabella', 'Silva', 27, 'F', 7, 'isabellasilva_teacher@gmail.com', '5GrX8BwdZ7'),
('Nicole', 'Ramos', 40, 'F', 8, 'nicoleteacher@gmail.com', 'YTMsqrGuAU');

insert into tb_users (first_name, last_name, age, gender,adress_id, parentlist_id, email, password) values
('Vinicius', 'Rosa', 17, 'M' ,9, 1, 'vinicius.rosa@gmail.com', 'vinirosa0'),
('Gustavo', 'Monteiro', 20, 'M',10, 2, 'gustavo-monteiro92@hotmail.com', 'gmO492'),
('Raquel', 'Cláudia', 18, 'F',11, 3, 'raquel026@gmail.com', 'elay025'),
('Valentina', 'Liz', 16, 'F',12, 4, 'va3040@gmail.com', 'vAlen5030'),
('Manoel', 'Caldeira', 19, 'M', 13, 5, 'manoel-caldeira85@gmail.com', 'cadeira5680'),
('Giovanni', 'Almeida', 20, 'M', 14, 6, 'giovanni-almeida88@hotmail.com', 'ICBXopuQph'),
('Bianca', 'Gonçalves', 17, 'F', 15, 7, 'biancagoncalves@gmail.com', '6PR3inGKwp'),
('Aurora', 'Mota', 15, 'F', 16, 8, 'auroramota@gmail.com', '7edHQZFgBN');


insert into tb_parents (first_name, last_name, age, gender, adress_id, email, password) values
('Tatiane', 'Elisa', 45, 'F', 9, 'tatiane_elisa@gmail.com', 'OOuRmWlFbO' ),
('Evelyn', 'Priscila', 50, 'F', 10, 'evelyn.priscila@hotmail.com', 'pzxjm20prs'),
('Caio', 'Nunes', 43, 'M', 11, 'caio-nunes74@gmail.com', 'DbL7u28XgE'),
('José', 'Anthony', 55, 'M', 12,'jose-anthony77@outlook.com', '34L6oW9MLM'),
('Caroline', 'Aparecida', 18, 'F', 13, 'carolaparecida@gmail.com', 'amora@4562' ),
('Fátima', 'Novaes', 23, 'F', 14, 'fatima-novaes91@outlook.com', 'NJ2MGTh8OO'),
('Hugo', 'Monteiro', 37, 'M', 15, 'hugo.carlos.monteiro@outlook.com', 'yRyQt9FSLb'),
('Sérgio', 'Freitas', 21, 'M', 16, 'sergio.nicolas.freitas@hotmail.com', 'DHNwnAXoDm');

select * from tb_adress;
select * from tb_parents;
select * from tb_users;
select * from tb_teachers;


insert into tb_teacherlist(teacher_id) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

insert into tb_userlist (user_id) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

insert into tb_parentlist (user_id, parent_id) values
(1, 1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8);


insert into tb_squads(userlist_id) values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);


select * from tb_teacherlist;
select * from tb_userlist;
select * from tb_parentlist;
select * from tb_squads;

--
-- CONSULTAS
--
select count(*) from tb_users where gender = 'M';
select count(*) from tb_users where gender = 'F';
select count(*) from tb_teachers where age between 20 and 30;
select count(*) from tb_teachers where age > 30;
select count(*) from tb_adress where state = 'São Paulo';
select count(*) from tb_adress where state = 'Minas Gerais';
select count(*) from tb_adress where state = 'Paraná';
select count(*) from tb_adress where state = 'Mato Grosso do Sul';
select count(*) from tb_adress where state = 'Rio de Janeiro';
select count(*) from tb_adress where state = 'Bahia';
select count(*) from tb_adress where state = 'Maranhão';
select count(*) from tb_adress where state = 'Espírito Santo';
select count(*) from tb_adress where state = 'Goiás';
select count(*) from tb_parents where email like '%@gmail.com';
select count(*) from tb_parents where email like '%@hotmail.com';
select count(*) from tb_parents where email like '%@outlook.com';

 drop database kani;