--ORDER BY
--ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama yapmak icin kullanilir
--ORDER BY komutu sadece SELECT komutu Ile kullanilir
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

SELECT * FROM insanlar ORDER BY adres;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

SELECT * FROM insanlar  WHERE isim = 'Mine' ORDER BY SSN;

--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
SELECT * FROM insanlar WHERE soyisim = 'Bulut' ORDER BY 2;

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insanlar ORDER BY isim ASC, soyisim DESC;

--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim, soyisim FROM insanlar ORDER BY LENGTH(soyisim);

--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT CONCAT(isim,'',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH(isim) + LENGTH(soyisim);

--GROUP BY
--Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT komutuyla birlikte kullanılır
CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

--Isme gore alinan toplam urunleri bulun
SELECT isim,SUM(Urun_miktar) AS Alinan_Toplam_Meyve FROM manav GROUP BY isim;

--Urun ismine gore urunu alan toplam kisi sayisi
SELECT Urun_adi, COUNT(isim) AS Urun_Alan_Kisi_Sayisi FROM manav GROUP BY Urun_adi;

--Alinan kilo miktarina gore musteri sayisi
SELECT Urun_miktar, COUNT(isim) AS Urun_Miktarini_Alan_Kisi_Sayisi FROM manav GROUP BY Urun_miktar;

CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--Isme gore toplam maaslari bulun
SELECT isim, SUM(maas) FROM personel GROUP BY isim;

--sehre gore toplam personel sayisini bulun
SELECT sehir, COUNT(isim) FROM personel GROUP BY sehir;

--Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
SELECT sirket, COUNT(isim) FROM personel WHERE maas > 5000 GROUP BY sirket;

--Her sirket icin Min ve Max maasi bulun
SELECT sirket, MIN(maas) AS Minimum_Maas, MAX(maas) AS Maksimum_Maas FROM personel GROUP BY sirket;

--HAVING
--HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.

--Her sirketin MIN maaslarini eger 2000’den buyukse goster
SELECT sirket, MIN(maas) FROM personel GROUP BY sirket HAVING MIN(maas) > 2000;

--Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
SELECT isim, SUM(maas) FROM personel GROUP BY isim HAVING SUM(maas) > 10000;

--Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
SELECT sehir, COUNT(isim) FROM personel GROUP BY sehir HAVING COUNT(isim) > 1;

--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
SELECT sehir, MAX(maas) FROM personel GROUP BY sehir HAVING MAX(maas) < 5000;





















































