--UNION OPERATOR
--Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i ayni olmalidir

--Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
SELECT sehir AS isci_veya_sehir_ismi, maas FROM personel WHERE maas > 5000
UNION
SELECT isim AS isci_veya_sehir_ismi, maas FROM personel WHERE maas > 4000;

--Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini bir tabloda gosteren sorgu yaziniz
SELECT isim AS isci_veya_sehir_ismi , maas FROM personel WHERE isim = 'Mehmet Ozturk'
UNION
SELECT sehir AS isci_veya_sehir_ismi , maas FROM personel WHERE sehir = 'Istanbul'

--NOT : 2.sorgunun sonuna ORDER BY komutunu kullanirsaniz tum tabloyu istediginiz siralamaya gore siralar
SELECT isim AS isci_veya_sehir_ismi , maas FROM personel WHERE isim = 'Mehmet Ozturk'
UNION
SELECT sehir AS isci_veya_sehir_ismi , maas FROM personel WHERE sehir = 'Istanbul' ORDER BY maas 

--Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az olanlari bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz
SELECT sehir AS isim_veya_sehir, maas FROM personel WHERE maas > 3000
UNION
SELECT isim AS isim_veya_sehir, maas FROM personel WHERE maas < 5000;

--Personel_bilgi isminde bir tablo olusturun.Icinde id,tel ve cocuk sayisi field’lari olsun. Id’yi FK yapin ve personel tablosu ile relation kurun
CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
)
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

CREATE TABLE personel_bilgi (
id int,
tel char(10) UNIQUE ,
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id));

INSERT INTO personel_bilgi VALUES(123456789, '5302345678' , 5);
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

--id’si 123456789 olan personelin Personel tablosundan sehir ve maasini, personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin
SELECT sehir AS Sehir_tel,maas AS cocuk_sayisi_veya_maas FROM personel WHERE id = 123456789
UNION
SELECT tel,cocuk_sayisi FROM personel_bilgi WHERE id = 123456789
/*
NOT : Union islemi yaparken
1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
2)Alt alta gelecek sutunlarin data type’lari ayni olmali
*/

-- Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
SELECT isim, maas FROM personel WHERE maas < 5000

--Ayni sorguyu UNION ile iki kere yazarak calistirin
SELECT isim, maas FROM personel WHERE maas < 5000
UNION
SELECT isim, maas FROM personel WHERE maas < 5000

--Ayni sorguyu UNION ALL ile iki kere yazarak calistirin
SELECT isim, maas FROM personel WHERE maas < 5000
UNION ALL
SELECT isim, maas FROM personel WHERE maas < 5000

/*
UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir,
Ayni kayit birden fazla olursa, sadece bir tanesini alir.
UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.
NOT : UNION ALL ile birlestirmelerde de
1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
2)Alt alta gelecek sutunlarin data type’lari ayni olmali
*/

--Tabloda personel maasi 4000’den cok olan tum sehirleri ve maaslari yazdirin
SELECT sehir, maas FROM personel WHERE maas > 4000;

--Tabloda personel maasi 5000’den az olan tum isimleri ve maaslari yazdirin
SELECT isim, maas FROM personel WHERE maas < 5000

--Iki sorguyu UNION ve UNION ALL ile birlestirin
SELECT sehir, maas FROM personel WHERE maas > 4000
UNION
SELECT isim, maas FROM personel WHERE maas < 5000

SELECT sehir, maas FROM personel WHERE maas > 4000
UNION ALL
SELECT isim, maas FROM personel WHERE maas < 5000

--INTERSECT OPERATOR

--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
SELECT id FROM personel WHERE sehir = 'Istanbul' OR sehir = 'Ankara';

--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
SELECT id FROM personel_bilgi WHERE cocuk_sayisi = 2 OR cocuk_sayisi = 3

--Iki sorguyu INTERSECT ile birlestirin
SELECT id FROM personel WHERE sehir = 'Istanbul' OR sehir = 'Ankara'
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi = 2 OR cocuk_sayisi = 3

--Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
SELECT id FROM personel WHERE maas NOT BETWEEN 4800 AND 5000

--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN(2,3)

--Iki sorguyu INTERSECT ile birlestirin
SELECT id FROM personel WHERE maas NOT BETWEEN 4800 AND 5000
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN(2,3)

--Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
SELECT isim FROM personel WHERE sirket = 'Honda'
INTERSECT 
SELECT isim FROM personel WHERE sirket = 'Ford'
INTERSECT 
SELECT isim FROM personel WHERE sirket = 'Tofas'





























































