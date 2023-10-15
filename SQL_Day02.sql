----------------DAY'2 NT-------------------------
------------TEKRAR----------------
create table sairler (
id int,
name varchar(50),
email varchar (50)
);

INSERT INTO sairler VALUES(1001,'Can Yücel','sair@gmail.com');
INSERT INTO sairler VALUES (1001, 'Necip Fazıl','sair@gmail.com');
INSERT INTO sairler VALUES (1002, '','sair@gmail.com');

INSERT INTO sairler (name) VALUES ('Nazım Hikmet');

SELECT * FROM sairler;

--9- tabloy UNIQUE constraint i ekleme
CREATE TABLE it_persons(
id SERIAL,
name VARCHAR(50),
email VARCHAR(50) UNIQUE,
salary REAL,
prog_lang VARCHAR(20)
);

INSERT INTO it_persons (name, email, salary, prog_lang) VALUES ('Alaprslan Yiğid', 'alp@gmail.com' ,5000,'java');
INSERT INTO it_persons (name, email, salary, prog_lang) VALUES ('Alperen Yiğid', 'alp2@gmail.com' ,5000,'java');
INSERT INTO it_persons (name, email, salary, prog_lang) VALUES ('İlayda Yiğid', 'alp3@gmail.com' ,5000,'java');

SELECT * FROM it_persons;

--10 tabloya not null constraint i ekleme

CREATE TABLE doctors(
id SERIAL,
name VARCHAR (50) NOT NULL,
email VARCHAR (50) UNIQUE,
salary REAL
);

INSERT INTO doctors (name, email, salary) VALUES ('Kutsi', 'kut@gmail',7000);
INSERT INTO doctors (name, email, salary) VALUES ('Hatice', 'hat@gmail',7000);


SELECT * FROM doctors;

---11 tabloya primary key constraint i ekleme
CREATE TABLE students2(
id int primary key,
name varchar(50),
grade real,
register_date date
);
---11 tabloya primary key constraint i ekleme 2. yöntem
CREATE TABLE students3(
id int,
name varchar(50),
grade real,
register_date date,
CONSTRAINT std_pk PRIMARY KEY (id)
);

SELECT * FROM students3;

---composite key
CREATE TABLE students4(
id int,
name varchar(50),
grade real,
register_date date,
CONSTRAINT compost_pk PRIMARY KEY (id,name)
);
SELECT * FROM students4;

--12 tabloya FK constraint i ekleme
CREATE TABLE address(
address_id int,
street varchar (50),
city varchar (20),
student_id int,--FK olsun
CONSTRAINT add_fk FOREIGN KEY (student_id) REFERENCES students3(id)
);

SELECT * FROM address;

--13 tabloya CHECK constraint i ekleme

CREATE TABLE personal(
id int,
name varchar(50),
salary real CHECK (salary >5000),
age int CHECK (age>0 AND age<50)--negatif olmamalı
);

INSERT INTO personal VALUES (11,'Ali Can', 2000,25);--ERROR:  Hata veren satır (11, Ali Can, 2000, 25) içeriyor."personal" tablosuna girilen yeni satır "personal_salary_check" check kısıtlamasını ihlal ediyor 
INSERT INTO personal VALUES (11,'Ali Can', 7000,55);--ERROR:  Hata veren satır (11, Ali Can, 7000, 55) içeriyor."personal" tablosuna girilen yeni satır "personal_age_check" check kısıtlamasını ihlal ediyor  
INSERT INTO personal VALUES (11,'Ali Can', 7000,25);


SELECT * FROM personal;












