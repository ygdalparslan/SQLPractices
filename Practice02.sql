/*************************************************************
******************* ON-DELETE-CASCADE  **********************
*************************************************************

CHILD TABLODA ON DELETE CASCADE KOMUTU YAZILMAZSA

1-) Child tablo silinmeden Parent tablo silinmeye calisildiginda 
		PgAdmin Eror verir. Yani Child tablo silinmeden Parent 
		tablo silinemez

2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye 
		calisildiginda Pg Admin Eror verir. yani Child tablodaki 
		veri silinmeden Parent tablodaki veri silinemez

CHILD TABLODA ON DELETE CASCADE KOMUTU YAZILIRSA

1-) Child tablo silinmeden Parent tablo silinebilir.
	PgAdmin Eror vermez

2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye 
		calisildiginda PgAdmin Eror vermez	Parent tablodaki veriyi 
		siler.Fakat bu durumda Child tablodaki veride silinir.
*/

CREATE TABLE parent2
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO parent2 VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent2 VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent2 VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent2 VALUES (104, 'Apple', 'Mick Jackson') ;

CREATE TABLE child2
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY (ted_vergino) REFERENCES parent2(vergi_no)
ON DELETE CASCADE	
);

INSERT INTO child2 VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child2 VALUES(102, 1002,'Kamera', 'Zehra 0z');
INSERT INTO child2 VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child2 VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child2 VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child2 VALUES(104, 1006,'Saat', 'Behlil Dana');
INSERT INTO child2 VALUES(104, 1007,'Kamera', 'Eymen Ozden');

-- SORU-1 : parent2 tablosundaki tum verileri siliniz
DELETE FROM parent2;
SELECT * FROM parent2;
SELECT * FROM child2;
-- SORU-2 : Parent2 tablosunu silinz
DROP TABLE parent2;
DROP TABLE parent2 CASCADE;
--SORU-3: child2 tablosunu siliniz
DROP TABLE child2;


CREATE TABLE toptancilar
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);

INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen'); 
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203,'Erikson', 'Mehmet Gör'); 
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');

CREATE TABLE malzemeler  --> child
(
ted_vergino int,
malzeme_id int,
malzeme_isim VARCHAR(20),
musteri_isim VARCHAR(25),
CONSTRAINT FK FOREIGN KEY (ted_vergino) REFERENCES toptancilar (vergi_no) on delete cascade
);


INSERT INTO malzemeler VALUES (201, 1001, 'Laptop', 'Asli Can'); 
INSERT INTO malzemeler VALUES (202, 1002, 'Telefon', 'Fatih Ak'); 
INSERT INTO malzemeler VALUES (202, 1003, 'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES (202, 1004, 'Laptop', 'Veli Tan');

select * from toptancilar;
select * from malzemeler;

--SORU-4: Malzemeler tablosundaki musteri_isim'i Asli Can olan kaydin malzeme_isim'ini, 
--toptancılar tablosunda irtibat_ismi 'Adem Coş' olan kaydin sirket_ismi ile güncelleyiniz.

UPDATE malzemeler
SET malzeme_isim=(SELECT sirket_ismi FROM toptancilar WHERE irtibat_ismi='Adem Coş')
WHERE musteri_isim='Asli Can';

--SORU-5: malzeme_ismi Laptop olan kaydin musteri_isim'ini, 
--sirket_ismi Apple'olan toptancinin irtibat_isim'i ile güncelleyiniz.

UPDATE malzemeler
SET musteri_isim=(SELECT irtibat_ismi FROM toptancilar WHERE sirket_ismi='Apple')
WHERE malzeme_isim = 'Laptop'

create table arac ( 
id int,
marka varchar (30),
model varchar(30), 
fiyat int,
kilometre int, 
vites varchar(20)
);

insert into arac values (100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values (101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values (102, 'Honda', 'Civic', 400000, 15000, 'Manuel' );
insert into arac values (103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );  
insert into arac values (104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values (105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values (106, 'Bugatti', 'Veyron', 950008, 5000, 'Otomatik' );

--SORU-6: arac tablosundaki en yüksek fiyat'ı listele
select max(fiyat) from arac;

--Soru-7:arac tablosundaki araçları toplam fiyatını bulunuz
select sum(fiyat) AS toplam_fiyat from arac;

--Soru-8: arac tablosundaki fiyat ortalamalarını bulunuz
select Round (avg(fiyat),2) AS ortalama_fiyat from arac;

--Soru-9: arac tablosunda kaç tane araç olduğunu bulunuz
select count(id) from arac;
select count(*) from arac;-- daha garantidir

CREATE TABLE meslekler
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
soyisin VARCHAR(50), 
meslek CHAR(9), 
maas int
);

INSERT INTO meslekler VALUES (1, 'Ali', 'Can', 'Doktor', '20000' ); 
INSERT INTO meslekler VALUES (2, 'Veli', 'Cem', 'Mühendis', '18000'); 
INSERT INTO meslekler VALUES (3, 'Mine', 'Bulut', 'Avukat', '17008'); 
INSERT INTO meslekler VALUES (4, 'Mahmut', 'Bulut', 'Ögretmen', '15000'); 
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13008'); 
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000'); 
INSERT INTO meslekler VALUES (7, 'Ali', 'Can', 'Marangoz', '10000' ); 
INSERT INTO meslekler VALUES (8, 'Veli', 'Cem', 'Tekniker', '14000');


--Soru-10: meslekler tablosunu isime göre sıralayınız
select * from meslekler
order by isim;

--Soru-11: meslekler tablosunda maaşı büyükten küçüğe doğru sıralayınız
select * from meslekler
order by maas DESC;

--Soru-12: meslekler tablosunda ismi Ali olanları maaşı büyükten küçüğe doğru sıralayınız
select * from meslekler
where isim='Ali'
order by maas DESC

--Soru-13: meslekler tablosunda id değeri 5 ten büyük olan ilk iki veriyi listeleyiniz
select * from meslekler
where id>5
limit 2;

--Soru-14: meslekler tablosunda maaşı en yüksek 3 kişinin bilgilerini getiriniz
select * from meslekler
order by maas DESC
limit 3

create table filmler (
film_id int,
film_name varchar(30), 
category varchar(30) 
);

insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu'); 
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');

create table aktorler (
id int,
actor_name varchar(30),
film_id int
);

insert into aktorler values (1, 'Ata Demirer', 1); 
insert into aktorler values (2, 'Necati Sasmaz', 2);
insert into aktorler values (3, 'Gupse Ozay', 3);
insert into aktorler values (4, 'Engin Gunaydin', 4);
insert into aktorler values (5, 'Cem Yilmaz', 5);

--Soru-15 Tüm film_name leri, kategorilerini ve filmlerde oynayan aktor_name leri listeleyin
select * from filmler AS A
LEFT JOIN aktorler AS B ON A.film_id=B.film_id;

select * from aktorler as B right join filmler as A ON A.film_id=B.film_id;

--Soru-16: tüm actor_name leri ve oynadigi film name leri listeleyiniz
select actor_name,film_name 
from aktorler as A
left join filmler as B on A.film_id=B.film_id;

-- 2. yol :

select actor_name,film_name 
from filmler as B
right join aktorler as A
on A.film_id=B.film_id;
























































