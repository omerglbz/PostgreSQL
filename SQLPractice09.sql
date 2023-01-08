--ALTER TABLE STATEMENT

/*
ALTER TABLE statement tabloda add, Type(modify)/Set, Rename veya drop columns
islemleri icin kullanilir.
ALTER TABLE statement tablolari yeniden isimlendirmek icin de kullanilir
*

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--ADD default deger ile tabloya bir field ekleme
ALTER TABLE personel
ADD ulke_isim varchar(20) DEFAULT ‘Turkiye';

--Tabloya birden fazla field ekleme
ALTER TABLE personel
ADD cinsiyet varchar(20) , ADD yas int;

--DROP tablodan sutun silme
ALTER TABLE personel
DROP COLUMN yas;

--RENAME COLUMN sutun adi degistirme
ALTER TABLE personel
RENAME COLUMN ulke_isim TO ulke_adi;

--RENAME tablonun ismini degistirme
ALTER TABLE personel
RENAME TO isciler;

--TYPE/SET sutunlarin ozelliklerini degistirme
ALTER TABLE isciler
ALTER COLUMN ulke_adi TYPE varchar(30),
ALTER COLUMN ulke_adi SET NOT NULL;

/*
Not: String data türünü numerik bir data türüne
dönüştürmek istersek;
ALTER COLUMN fieldname
TYPE int USING(fieldname::int) şeklinde yaparız.
*/








