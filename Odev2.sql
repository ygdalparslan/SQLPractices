--HOMEWORK-2--
------SQL Queries-1 Çözümler----------
--1--
--2--
create table musteri(
musteri_no SERIAL,
isim varchar(50) NOT NULL CHECK (isim <> ''),
yas int CHECK (yas>0),
cinsiyet char(1) CHECK (cinsiyet IN ('K', 'E')),
gelir real,
meslek varchar(20),
sehir varchar(20),
CONSTRAINT mus_no_PK PRIMARY KEY (musteri_no)
);
--3--
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('ALİ',35,'E',2500,'MÜHENDİS','İSTANBUL');

SELECT * FROM musteri;
--3 devam--
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('BURAK',   25, 'E', 3500, 'MİMAR',       'İZMİR');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('CEYHUN',  45, 'E', 2000, 'MÜHENDİS',    'ANKARA');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('DEMET',   30, 'K', 3000, 'ÖĞRETMEN',    'ANKARA');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('FERHAT',  40, 'E', 2500, 'MİMAR',       'İZMİR');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('GALİP',   55, 'E', 4000, 'ÖĞRETMEN',    'İSTANBUL');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('KÖKSAL',  25, 'E', 2000, 'AVUKAT',      'İZMİR');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('LEYLA',   60, 'K', 2500, 'MİMAR',       'İSTANBUL');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('MELEK',   30, 'K', 2500, 'ÖĞRETMEN',    'İSTANBUL');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('JALE',    40, 'K', 6000, 'İŞLETMECİ',   'ANKARA');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('TEKİN',   45, 'E', 2000, 'AVUKAT',      'ANKARA');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('SAMET',   20, 'E', 3000, 'MİMAR',       'İSTANBUL');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('ŞULE',    20, 'K', 4500, 'ÖĞRETMEN',    'İSTANBUL');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('VELİ',    40, 'E', 2500, 'ÖĞRETMEN',    'İZMİR');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('ZEYNEP',  50, 'K', 3500, 'TESİSATÇI',   'İZMİR');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('ARDA',    55, 'E', 2000, 'KUAFÖR',      'İZMİR');
insert into musteri (isim, yas,cinsiyet,gelir,meslek,sehir) VALUES ('MELİS',   30, 'K', 3000, 'KUAFÖR',      'ANKARA');
--4--
SELECT * FROM musteri;
--5--
SELECT (isim, meslek) FROM musteri;
--6--
CREATE TABLE sehirler(
alan_kodu int,
isim varchar(20) NOT NULL,
nufus int,
CONSTRAINT alan_kodu_pk PRIMARY KEY (alan_kodu)
);
--veya
CREATE TABLE sehirler(
alan_kodu INT PRIMARY KEY,
isim VARCHAR(50) NOT NULL,
nufus INT
);

SELECT * FROM sehirler;

--7-a--
CREATE TABLE tedarikciler3(
tedarikci_id varchar(20),
tedarikci_ismi varchar(30),
iletisim_isim varchar(20) unique,
CONSTRAINT ted_id_pk PRIMARY KEY (tedarikci_id)
);
SELECT * FROM tedarikciler3;
--7-b--
CREATE TABLE urunler(
tedarikci_id varchar(20),
urun_id varchar(20),
CONSTRAINT tad_id_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3 (tedarikci_id)
);

select * from urunler;






















