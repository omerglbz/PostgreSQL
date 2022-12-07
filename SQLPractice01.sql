--Tablo olusturma
CREATE TABLE tedarikciler (
tedarikci_id real PRIMARY KEY,
tedarikci_ismi varchar(20),
tedarikci_adres varchar(50),
ulasim_tarihi date
)
--Var olan tablodan yeni bir tablo olusturma
CREATE TABLE tedarikci_ziyaret
AS SELECT tedarikci_ismi, ulasim_tarihi
FROM tedarikciler
--“ ogretmenler” isminde tablo olusturun. Icinde “kimlik_no”, “isim”, “brans” ve “cinsiyet” field’lari olsun.
--“ogretmenler” tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
--Kimlik_no: 234431223, isim: Ayse Guler, brans : Matematik, cinsiyet: kadin.
CREATE TABLE ogretmenler(
kimlik_no int PRIMARY KEY,
isim varchar(20),
brans varchar(20),
cinsiyet varchar(6)
)
INSERT INTO ogretmenler values(234431223, 'Ayse Guler', 'Matematik', 'kadin')
SELECT * FROM ogretmenler
--“ogretmenler” tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
--Kimlik_no: 567597624, isim: Ali Veli
INSERT INTO ogretmenler values(567597624, 'Ali Veli')
SELECT * FROM ogretmenler
--“id” field’ini “tekrarsiz” yapmak icin , id field’inda Data Type’dan sonra “UNIQUE” yazmak gerekir
CREATE TABLE ogrenciler2
(
id char(4) UNIQUE,
isim varchar(50),
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date
)
--“isim” field’inin “NULL” deger kabul etmemesi icin , isim field’i olusturulurken Data Type’dan sonra “NOT NULL” yazmak gerekir
CREATE TABLE ogrenciler3
(
id char(4) UNIQUE,
isim varchar(50) NOT NULL,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date
)
--“sehirler” isimli bir Table olusturun.
--Tabloda “alan_kodu”, “isim”, “nufus” field’lari olsun. Isim field’i bos birakilamasin.
--“alan_kodu” field’ini “Primary Key” yapin
CREATE TABLE sehirler (
alan_kodu int PRIMARY KEY,
isim varchar(20) NOT NULL,
nufus int
)
--“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,
--“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
--“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
--“tedarikci_id” yi Foreign Key yapin.
CREATE TABLE tedarikciler3 (
tedarikci_id int PRIMARY KEY,
tedarikci_isim varchar(20),
iletisim_isim varchar(20)
)
CREATE TABLE urunler(
tedarikci_id int,
urun_id int,
CONSTRAINT urunler_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)
)
--“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lariolsun. 
--“id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
--“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir”
--fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
CREATE TABLE calisanlar (
calisanlar_id int PRIMARY KEY,
isim varchar(20) UNIQUE,
maas int NOT NULL,
ise_baslama date
)
CREATE TABLE adresler (
adres_id int,
sokak varchar(20),
cadde varchar(20),
sehir varchar(20),
CONSTRAINT fk_adresler FOREIGN KEY (adres_id) REFERENCES calisanlar(calisanlar_id)
)
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018/04/14')
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

--sehirler2 tablosu olusturalim, nufusun negatif deger girilmemesi icin sinirlandirma (Constraint) koyalim.
CREATE TABLE sehirler2
(
alan_kodu int PRIMARY KEY,
isim varchar(20) NOT NULL,
nufus int CHECK (nufus>0)
);
--Tablodan sadece isim field’indaki tum datalari getirir
SELECT isim FROM calisanlar
--Tablodan sadece maas’ı 5000 den buyuk olanlarin isim field’indaki datalari getirir
SELECT isim FROM calisanlar
WHERE maas > 5000
--Tablodan mass ve isim field’indaki tum datalari getirir
SELECT isim,maas FROM calisanlar
--Tablodan id’si 10002 olan kaydin maas ve isim field’indaki datalari getirir
SELECT isim,maas FROM calisanlar
WHERE calisanlar_id = 10002
--DELETE FROM tablo_adı; Tablonun tüm içerğini siler.
--Veriyi seçerek silmek için WHERE komutu kullanılır
--* DELETE FROM tablo_adı WHERE sutun_adi = veri; Tabloda istediğiniz veriyi siler.
CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);
-- id'si 124 olan ogrenciyi siliniz.
DELETE FROM ogrenciler6 WHERE id = 124
-- ismi Kemal Yasa olan satırını siliniz.
DELETE FROM ogrenciler6 WHERE isim = 'Kemal Yasa'
-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim
DELETE FROM ogrenciler6 WHERE isim = 'Nesibe Yilmaz' OR isim = 'Mustafa Bak'
-- İsmi Ali Can ve id'si 123 olan kaydı siliniz.
DELETE FROM ogrenciler6 WHERE isim = 'Ali Can' AND id = 123
-- id 'si 126'dan büyük olan kayıtları silelim.
DELETE FROM ogrenciler6 WHERE id > 126
-- id'si 123, 125 veya 126 olanları silelim.
DELETE FROM ogrenciler6 WHERE id = 123 OR id = 125 OR id = 126
--TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler
--Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliğini aktif hale getirebiliriz.
--Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli
CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id)
REFERENCES talebeler(id)
on delete cascade
);
INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

DELETE from notlar where talebe_id='123'; -- child
-- child tablodaki veriyi sildiğimiz zaman sadece child'daki veri silinir. parent taki veri silinmez.
DELETE from talebeler where id='126';-- parent
-- parent tablodaki veriyi sildiğimiz zaman child'daki veride silinir.
DELETE FROM talebeler; -- Parent tablo ile birlikte child tablo daki verileride siler
DROP TABLE talebeler CASCADE; -- İlişkili tablolardan parent olan talebeler tablosunu siler



























