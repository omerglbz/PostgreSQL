--5000’den az maas alip Honda’da calismayanlari yazdirin
SELECT isim,sirket
FROM personel
WHERE maas<5000
SELECT 2
EXCEPT
SELECT isim,sirket
FROM personel
WHERE sirket='Honda'

--Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve sehirlerini listeleyin
SELECT isim,sehir
FROM personel
WHERE isim='Mehmet Ozturk'
EXCEPT
SELECT isim,sirket
FROM personel
WHERE sehir='Istanbul';

--JOINS
/*
5 Cesit Join vardir
1) INNER JOIN iki Tablodaki ortak datalari gosterir
2) LEFT JOIN Ilk datada olan tum recordlari gosterir
3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
4) FULL JOIN Iki tablodaki tum recordlari gosterir
5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur.
*/

CREATE TABLE sirketler
(
sirket_id int,
sirket_isim varchar(20)
);

CREATE TABLE siparisler
(
siparis_id int,
sirket_id int,
siparis_tarihi date
);

INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');

INSERT INTO siparisler VALUES(11, 101, '17-Apr-2020');
INSERT INTO siparisler VALUES(22, 102, '18-Apr-2020');
INSERT INTO siparisler VALUES(33, 103, '19-Apr-2020');
INSERT INTO siparisler VALUES(44, 104, '20-Apr-2020');
INSERT INTO siparisler VALUES(55, 105, '21-Apr-2020');

--INNER JOINS

--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;

/*
NOT :
1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
*/

--LEFT JOINS

SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi
FROM sirketler LEFT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;

/*
NOT :
1) Left Join’de ilk tablodaki tum record’lar gosterilir.
2) Ilk tablodaki datalara 2.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir ancak
ortak olmayan datalar icin o kisimlar bos kalir
3) Ilk yazdiginiz Tablonun tamamini aldigi icin hangi tabloyu istedigimize karar verip once onu yazmaliyiz
*/

--RIGHT JOINS


SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi
FROM sirketler RIGHT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;

/*
NOT :
1)Right Join’de ikinci tablodaki tum record’lar gosterilir.
2)Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir
ancak ortak olmayan datalar icin o kisimlar bos kalir
*/

--FULL JOINS

SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi
FROM sirketler FULL JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;

/*
NOT :
1) FULL Join’de iki tabloda var olan tum record’lar gosterilir.
2) Bir tabloda olup otekinde olmayan data’lar bos kalir
*/

--SELF JOINS

CREATE TABLE personel
(
id int,
isim varchar(20),
title varchar(60),
yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4);
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

SELECT p1.isim AS personel_ismi, p2.isim AS yonetici_ismi
FROM personel p1 INNER JOIN personel p2
ON p1.yonetici_id = p2.id;
































