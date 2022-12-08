/*
IN Condition birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari
(Condition) tek komutla yazabilme imkani verir
AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir.
OR (veya): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
*/
CREATE TABLE musteriler(
urun_id int,
musteri_isim varchar(20),
urun_isim varchar(20)
)
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler
WHERE urun_isim = 'Orange' OR urun_isim = 'Apple' OR urun_isim = 'Apricot'

SELECT * FROM musteriler
WHERE urun_isim IN ('Orange','Apple','Apricot')

/*
BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir (INCLUSIVE)
*/
--Urun_id 20 ile 40 arasinda olan urunlerin tum bilgilerini listeleyiniz
SELECT *
FROM musteriler
WHERE urun_id>=20 AND urun_id<=40;

SELECT * FROM musteriler
WHERE urun_id BETWEEN 20 AND 40

/*
NOT BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek
komutla yazabilme imkani verir. Yazdigimiz 2 sinirda araliga harictir (EXCLUSIVE)
*/
--Urun_id 20 ile 40 arasinda olmayan urunlerin tum bilgilerini listeleyiniz
SELECT * FROM musteriler
WHERE urun_id < 20 OR urun_id > 40

SELECT * FROM musteriler
WHERE urun_id NOT BETWEEN 20 AND 40


CREATE TABLE personel
(
personel_id char(4),
isim varchar(50),
maas int
);
INSERT INTO personel values('1001', 'Ali Can', 70000);
INSERT INTO personel values('1002', 'Veli Mert', 85000);
INSERT INTO personel values('1003', 'Ayşe Tan', 65000);
INSERT INTO personel values('1004', 'Derya Soylu', 95000);
INSERT INTO personel values('1005', 'Yavuz Bal', 80000);
INSERT INTO personel values('1006', 'Sena Beyaz', 100000)

-- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
SELECT * FROM personel
WHERE personel_id BETWEEN '1003' AND '1005'

--Maaşı 100000 ve ismi Sena Beyaz olan personeli listeleyiniz
SELECT * FROM personel
WHERE maas = 100000 AND isim = 'Sena Beyaz'

--SUBQUERY baska bir SORGU(query)’nun icinde calisan SORGU’dur
--WHERE’ den sonra kullanilabilir
CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
SELECT isim,maas,isyeri FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE calisan_sayisi > 15000)
-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
SELECT isim,maas,sehir FROM calisanlar2
WHERE isyeri IN (SELECT marka_isim FROM markalar WHERE marka_id > 101)
-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
SELECT marka_id, calisan_sayisi FROM markalar
WHERE marka_isim IN (SELECT isyeri FROM calisanlar2 WHERE sehir = 'Ankara')

/*
Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde
kullanilabilir.
Ancak, Sorgu tek bir değer döndürüyor olmalidir.
SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı
*/
/*
select max(maas) from calisanlar
select sum(maas) from calisanlar
select avg(maas) from calisanlar
select round(avg(maas),2) from calisanlar == 19000/7 = 2714,29
select min(maas) from calisanlar
select count(maas) from calisanlar
*/
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz
SELECT marka_id, marka_isim, (SELECT count(sehir) FROM calisanlar2 WHERE marka_isim = isyeri) AS sehir_sayisi
FROM markalar
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
SELECT marka_isim,calisan_sayisi, (SELECT SUM(maas) FROM calisanlar2 WHERE marka_isim = isyeri) AS toplma_maas
FROM markalar
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi, (SELECT MAX(maas) FROM calisanlar2 WHERE marka_isim = isyeri) AS max_maas,
(SELECT MIN(maas) FROM calisanlar2 WHERE marka_isim = isyeri) AS min_maas
FROM markalar


CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota')

CREATE TABLE nisan
(
urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

/*
EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar.
*/

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
SELECT urun_id, musteri_isim FROM mart
WHERE exists (SELECT urun_id FROM nisan WHERE mart.urun_id = nisan.urun_id)
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız
SELECT urun_isim, musteri_isim FROM nisan 
WHERE exists (SELECT urun_isim FROM mart WHERE nisan.urun_isim = mart.urun_isim)
--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
SELECT urun_isim, musteri_isim FROM nisan
WHERE not exists (SELECT urun_isim FROM mart WHERE nisan.urun_isim = mart.urun_isim)







