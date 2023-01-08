--NOT LIKE

--ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime NOT LIKE 'h%';

--a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime NOT LIKE '%a%';

--ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime NOT LIKE '_de%';

--2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime !~ '[_eio]';

--UPPER – LOWER - INITCAP

--Tablolari yazdirirken buyuk harf, kucuk harf veya ilk harfleri buyuk digerleri kucuk harf yazdirmak icin kullaniriz
SELECT UPPER(kelime)
FROM kelimeler;

SELECT LOWER(kelime)
FROM kelimeler;

SELECT INITCAP(kelime)
FROM kelimeler;

--DISTINCT

--DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.

CREATE TABLE musteri_urun
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal');
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal');
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma');
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut');
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma');
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal');
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi');
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');


SELECT DISTINCT urun_isim
FROM musteri_urun;

SELECT DISTINCT musteri_isim
FROM musteri_urun;


--Tabloda kac farkli meyve vardir ?
SELECT COUNT(DISTINCT urun_isim) AS urun_cesit_sayisi
FROM musteri_urun;


--FETCH NEXT (SAYI) ROW ONLY- OFFSET

--Sirali tablodan ilk 3 kaydi listeleyin
SELECT *
FROM musteri_urun
ORDER BY urun_id
FETCH NEXT 3 ROW ONLY;

--Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin
SELECT *
FROM musteri_urun
ORDER BY urun_id
OFFSET 3 ROW
FETCH NEXT 4 ROW ONLY;




























