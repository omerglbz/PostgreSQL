CREATE TABLE tedarikciler (
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
)
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urunler -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino)
REFERENCES tedarikciler(vergi_no)
on delete cascade
);
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
UPDATE tedarikciler SET firma_ismi = 'Vestel' WHERE vergi_no = 102;
SELECT * FROM tedarikciler
-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler SET firma_ismi = 'Casper' WHERE vergi_no = 101;
UPDATE tedarikciler SET irtibat_ismi = 'ALi Veli' WHERE vergi_no = 101;
UPDATE tedarikciler SET firma_ismi = 'Casper', irtibat_ismi = 'Ali Veli' WHERE vergi_no = 101;
-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urunler SET urun_isim = 'Telefon' WHERE urun_isim = 'Phone';
SELECT * FROM urunler
-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urunler SET urun_id = urun_id + 1 WHERE urun_id > 1004;
-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak guncelleyiniz.
UPDATE urunler SET urun_id = urun_id + ted_vergino;
--urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
UPDATE urunler SET urun_isim = (SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi = 'Adam Eve') WHERE musteri_isim = 'Ali Bak';
--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi = 'Apple') WHERE urun_isim = 'Laptop';

--Aliases kodu ile tablo yazdirilirken, field isimleri sadece o cikti icin degistirilebilir
CREATE TABLE calisanlar
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) );
INSERT INTO calisanlar VALUES(123456789, 'Ali Can',  'Istanbul');
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT calisan_id AS id, calisan_isim AS isim, calisan_dogdugu_sehir AS dogum_yeri FROM calisanlar;

--Yukarda verilen “personel” tablosunu olusturun
CREATE TABLE personel (
id int,
isim VARCHAR(20),
soyisim VARCHAR(20),
email VARCHAR(50),
ise_baslama_tarihi VARCHAR(20),
is_unvani VARCHAR(20),
maas int
)
INSERT INTO personel values(123456789, 'Ali', 'Can', 'alican@gmail.com', '10-APR-10', 'isci', 5000);
INSERT INTO personel values(123456788, 'Veli', 'Cem', 'velicemn@gmail.com', '10-JAN-12', 'isci', 5500);
INSERT INTO personel values(123456787, 'Ayse', 'Gul', 'aysegul@gmail.com', '01-MAY-14', 'muhasebeci', 4500);
INSERT INTO personel values(123456789, 'Fatma', 'Yasa', 'fatmayasa@gmail.com', '10-APR-09', 'muhendis', 7500);

--Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin
SELECT isim FROM personel WHERE maas < 5000 OR is_unvani = 'isci';
--Iscilerin tum bilgilerini listeleyin
SELECT * FROM personel WHERE is_unvani = 'isci';
--Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
SELECT is_unvani, maas FROM personel WHERE soyisim IN ('Can', 'Cem', 'Gul');
--Maasi 5000’den cok olanlarin email ve is baslama tarihlerini listeleyin
SELECT email, ise_baslama_tarihi FROM personel WHERE maas > 5000;
--Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerini listeleyin
SELECT * FROM personel WHERE maas NOT BETWEEN 5000 AND 7000;

-- IS NULL Arama yapilan field’da NULL degeri almis kayitlari getirir.
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * FROM insanlar WHERE isim IS NULL;

SELECT * FROM insanlar WHERE isim IS NOT NULL;

UPDATE insanlar SET isim ='Isim Girilmemis' WHERE isim IS NULL;










