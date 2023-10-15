--TEK YORUM SATIRI
/*ÇOKLU YORUM SATIRI*/
----------------------------DAY'1 NT----------------------------
--1-Datebase oluşturma--DDL
CREATE DATABASE alparslan;---SQL komutlarında büyük küçük harf duyarlılığı yoktur


--2-database silme--DDL
DROP DATABASE alparslan;

--3-table oluşturma--DDL
CREATE TABLE students(
id CHAR(4),
name VARCHAR(20),
grade REAL,
register_date DATE
);

--4-mevcut bir tablodan yeni tablo oluşturma
CREATE TABLE grades AS SELECT name, grade FROM students;

--5-tabloya data ekleme--DML
INSERT INTO students VALUES ('1001','Sherlock Holmes',99.8,'2023-10-04');
INSERT INTO students VALUES ('1002','Hary Potter', 100.0,now());

--6-tablodaki tüm kayıtları(dataları) görüntüleme--DQL
SELECT * FROM students;

--7-tablodaki bazı sütunlara data ekleme
INSERT INTO students(name,grade) VALUES('Jack Sparrow',88.8)

--8-tabloda tüm kayıtların belirli sütunlarındaki dataları görüntüleme
SELECT name, grade FROM students;

/*ÖDEVV:)
1) Tablo Oluşturma
​
“tedarikciler” isminde bir tablo olusturun,
“tedarikci_id”, “tedarikci_ismi”, “tedarikci_adres”
ve “ulasim_tarihi”	field’lari olsun. 
​
2) Var olan tablodan yeni tablo olusturmak 
 “tedarikci_info” isminde bir tabloyu  “tedarikciler” tablosundan olusturun.
Icinde “tedarikci_ismi”, “ulasim_tarihi” field’lari olsun
​
3) Data ekleme
“ ogretmenler” isminde tablo olusturun.
 Icinde “kimlik_no”, “isim”, “brans” ve “cinsiyet” field’lari olsun.
“ogretmenler” tablosuna bilgileri asagidaki gibi olan kisileri ekleyin.
kimlik_no: 234431223, isim: Ayse Guler, brans : Matematik, cinsiyet: kadin.
kimlik_no: 234431224, isim: Ali Guler, brans : Fizik, cinsiyet: erkek.
​
4) bazı fieldları olan kayıt ekleme
“ogretmenler” tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
kimlik_no: 567597624, isim: Veli Guler
--------------------------------------*/

--1) Tablo Oluşturma
CREATE TABLE tedarikciler(
tedarikci_id CHAR (4),
tedarikci_ismi VARCHAR(20),
tedarikci_adres VARCHAR(30),
ulasim_tarihi DATE
);
--2) Var olan tablodan yeni tablo olusturmak
CREATE TABLE tedarikci_info AS SELECT tedarikci_ismi, ulasim_tarihi FROM tedarikciler;
--3) Data ekleme
CREATE TABLE ogretmenler(
kimlik_no CHAR(9),
isim VARCHAR (20),
brans VARCHAR (20),
cinsiyet VARCHAR (20)
);
INSERT INTO ogretmenler VALUES ('234431223','Ayse Guler','Matematik','kadin');
INSERT INTO ogretmenler VALUES ('234431224','Ali Guler','Fizik','erkek');
--4) bazı fieldları olan kayıt ekleme
INSERT INTO ogretmenler (kimlik_no,isim) VALUES ('567597624','Veli Guler');

SELECT * FROM ogretmenler 

