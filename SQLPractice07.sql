--LIKE

CREATE TABLE musteriler
(
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);

--% => 0 veya birden fazla karakter belirtir

--Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler
WHERE isim LIKE 'A%';

--Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir
FROM musteriler
WHERE isim LIKE '%e';

--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir
FROM musteriler
WHERE isim LIKE '%er%';

-- _ => sadece bir karakteri gosterir.

--Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler
WHERE isim LIKE '_atma';

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT *
FROM musteriler
WHERE isim LIKE '_a%';

--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler
WHERE isim LIKE '__s%';

--Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler
WHERE isim LIKE '__s_';

--Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler
WHERE isim LIKE 'F___%';

--Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler
WHERE isim LIKE '_a_m%';

/*
REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/

CREATE TABLE kelimeler
(
id int UNIQUE,
kelime varchar(50) NOT NULL,
Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1008, 'hct', 3);
INSERT INTO kelimeler VALUES (1005, 'adem', 4);
INSERT INTO kelimeler VALUES (1006, 'selim', 5);
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

--Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ 'h[ai]t';

--Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini
yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ 'h[a-k]t';

--Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ '[mi]';

--a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ '^[as]';

--m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM kelimeler
WHERE kelime ~ '[mf]$';














