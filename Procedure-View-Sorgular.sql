CREATE PROCEDURE OgrenciNotlariniAl(IN ogrenci_id INT)
BEGIN
SELECT
o.OgrenciID,
o.Adi,
o.Soyadi,
d.DersAdi,
n.OgrenciNotu,
s.Tarih,
s.Saat,
s.Yer
FROM
ogrenci o
JOIN
kayit k ON o.OgrenciID = k.OgrenciID
JOIN
ders d ON k.DersID = d.DersID
JOIN
notlar n ON k.KayitID = n.KayitID
JOIN
sinav s ON n.SinavID = s.SinavID
WHERE
o.OgrenciID = ogrenci_id;
END //
DELIMITER ;


CREATE VIEW OgrenciNotlariView AS
SELECT
o.OgrenciID,
o.Adi,
o.Soyadi,
d.DersAdi,
n.OgrenciNotu,
s.Tarih,
s.Saat,
s.Yer
FROM
ogrenci o
JOIN
kayit k ON o.OgrenciID = k.OgrenciID
JOIN
ders d ON k.DersID = d.DersID
JOIN
notlar n ON k.KayitID = n.KayitID
JOIN
sinav s ON n.SinavID = s.SinavID

CALL OgrenciNotlariniAl(1);

SELECT * FROM ogrencinotlariview WHERE OgrenciID = 1 AND Tarih BETWEEN '2023-01-15' AND
'2023-01-17';

SELECT * FROM ogrencinotlariview WHERE DersAdi = 'Kimya' AND OgrenciNotu >= 60;

SELECT * FROM ogrencinotlariview WHERE Yer = 'C301';

SELECT MAX(OgrenciNotu) FROM ogrencinotlariview WHERE DersAdi ='Matematik';