
CREATE DATABASE universite;

CREATE TABLE bolum(
BolumID INT PRIMARY KEY,
BolumAdi VARCHAR(255) NOT NULL,
Fakulte VARCHAR(255) NOT NULL
);

CREATE TABLE ders (
DersID INT PRIMARY KEY,
DersAdi VARCHAR(255) NOT NULL,
Kredi INT NOT NULL,
BolumID INT,
FOREIGN KEY (BolumID) REFERENCES bolum(BolumID)
);

CREATE TABLE ogrenci (
OgrenciID INT PRIMARY KEY,
Adi VARCHAR(255) NOT NULL,
Soyadi VARCHAR(255) NOT NULL,
DogumTarihi DATE NOT NULL,
Cinsiyet VARCHAR(10) NOT NULL,
BolumID INT,
FOREIGN KEY (BolumID) REFERENCES bolum(BolumID)
);

CREATE TABLE kayit (
KayitID INT PRIMARY KEY,
OgrenciID INT,
DersID INT,
BolumID INT,
FOREIGN KEY (OgrenciID) REFERENCES ogrenci(OgrenciID),
FOREIGN KEY (DersID) REFERENCES ders(DersID),
FOREIGN KEY (BolumID) REFERENCES ogrenci(BolumID)
);

CREATE TABLE sinav (
SinavID INT PRIMARY KEY,
Tarih DATE NOT NULL,
Saat TIME NOT NULL,
Yer VARCHAR(255) NOT NULL,
DersID INT,
FOREIGN KEY (DersID) REFERENCES ders(DersID)
);

CREATE TABLE notlar (
NotID INT PRIMARY KEY,
OgrenciNotu INT NOT NULL,
KayitID INT,
SinavID INT,
FOREIGN KEY (KayitID) REFERENCES kayit(KayitID),
FOREIGN KEY (SinavID) REFERENCES sinav(SinavID)
);

INSERT INTO bolum(BolumID, BolumAdi, Fakulte) VALUES
(1, 'Bilgisayar', 'Mühendislik'),
(2, 'Elektrik', 'Mühendislik'),
(3, 'Kimya', 'Fen Bilimleri'),
(4, 'İnşaat', 'Mimarlık');

INSERT INTO ders (DersID, DersAdi , Kredi, BolumID) VALUES
(101, 'Matematik', 3, 1),
(102, 'Fizik', 4, 1),
(103, 'Kimya', 3, 3),
(104, 'İngilizce', 2, 2),
(105, 'Programlama', 4, 1);

INSERT INTO ogrenci (OgrenciID, Adi, Soyadi, DogumTarihi, Cinsiyet, BolumID) VALUES
(1, 'Ahmet', 'Yılmaz', '1999-01-01', 'Erkek', 1),
(2, 'Ayşe', 'Kaya', '2000-02-15', 'Kadın', 2),
(3, 'Mehmet', 'Demir', '1998-10-20', 'Erkek', 3),
(4, 'Zeynep', 'Aksoy', '2001-10-05', 'Kadın', 4),
(5, 'Fatma', 'Yıldız', '2002-03-12', 'Kadın', 1),
(6, 'Mustafa', 'Kara', '2001-08-25', 'Erkek', 2),
(7, 'Ayşe', 'Aydın', '2000-05-18', 'Kadın', 3),
(8, 'Ali', 'Toprak', '1999-12-03', 'Erkek', 4),
(9, 'Selin', 'Şahin', '2002-07-09', 'Kadın', 1),
(10, 'Deniz', 'Yılmaz', '2001-04-08', 'Erkek', 4);

INSERT INTO kayit (KayitID, OgrenciID, DersID, BolumID) VALUES
(1, 1, 101,1),
(2, 1, 102,1),
(3, 2, 101,2),
(4, 2, 103,2),
(5, 3, 102,3),
(6, 3, 105,3),
(7, 4, 104,4),
(8, 4, 105,4),
(9, 5, 101,3),
(10, 5, 102,4),
(11, 6, 101,3),
(12, 6, 103,1),
(13, 7, 102,2),
(14, 7, 105,3),
(15, 8, 104,4),
(16, 8, 105,1),
(17, 9, 104,1),
(18, 9, 105,2),
(19, 10, 101,3),
(20, 10, 103,3);

INSERT INTO sinav (SinavID, Tarih, Saat, Yer, DersID) VALUES
(1, '2023-01-15', '09:00', 'D101',101),
(2, '2023-01-17', '10:30', 'C202',102),
(3, '2023-01-20', '14:00', 'A105',103),
(4, '2023-01-22', '11:00', 'B201',104),
(5, '2023-01-25', '13:30', 'E301',101),
(6, '2023-02-01', '14:00', 'E302',102),
(7, '2023-02-05', '11:30', 'B102',103),
(8, '2023-02-10', '09:00', 'D205',104),
(9, '2023-02-15', '13:30', 'C301',105),
(10, '2023-02-20', '10:00', 'A201',105),
(11, '2023-03-01', '13:00', 'C301',101),
(12, '2023-03-05', '10:30', 'A102',104);

INSERT INTO notlar (NotID, OgrenciNotu, KayitID, SinavID) VALUES
(1, 75,1, 1),
(2, 88, 1, 2),
(3, 92, 2, 1),
(4, 70, 2, 3),
(5, 95, 3, 2),
(6, 85, 3, 5),
(7, 78, 4, 4),
(8, 90, 4, 5),
(9, 85, 9, 6),
(10, 92, 9, 7),
(11, 78, 10, 6),
(12, 90, 10, 8),
(13, 95,11, 9),
(14, 88, 11, 10),
(15, 70, 12, 7),
(16, 82, 12, 8),
(17, 96, 13, 9),
(18, 85, 13, 10),
(19, 88, 19, 11),
(20, 95, 19, 12);

SELECT bolum.BolumAdi, COUNT(ogrenci.OgrenciID) AS ogrenci_sayisi
FROM bolum
INNER JOIN ogrenci ON bolum.BolumID = ogrenci.BolumID
GROUP BY bolum.BolumAdi;


SELECT ogrenci.Adi, ogrenci.Soyadi, count(kayit.DersID) as alinan_ders
FROM ogrenci
LEFT JOIN kayit ON ogrenci.OgrenciID = kayit.OgrenciID
GROUP BY ogrenci.Adi, ogrenci.Soyadi;

SELECT bolum.BolumAdi, AVG(notlar.OgrenciNotu) AS ogrenci_notu
FROM bolum
INNER JOIN ogrenci ON bolum.BolumID = ogrenci.BolumID
INNER JOIN kayit ON ogrenci.OgrenciID= kayit.OgrenciID
INNER JOIN notlar ON kayit.KayitID = notlar.KayitID
GROUP BY bolum.BolumAdi;


SELECT ogrenci.Adi, ogrenci.Soyadi, SUM(ders.Kredi) AS toplam_kredi
FROM ogrenci
INNER JOIN kayit ON ogrenci.OgrenciID = kayit.OgrenciID
INNER JOIN ders ON kayit.DersID = ders.DersID
GROUP BY ogrenci.Adi, ogrenci.Soyadi;

SELECT ogrenci.Adi, ogrenci.Soyadi, COUNT( sinav.SinavID) AS sinav_sayisi
FROM ogrenci
INNER JOIN kayit ON ogrenci.OgrenciID = kayit.OgrenciID
INNER JOIN sinav ON kayit.DersID = sinav.DersID
GROUP BY ogrenci.Adi, ogrenci.Soyadi;

SELECT sinav.SinavID, MAX(notlar.OgrenciNotu) AS max_not
FROM sinav
INNER JOIN notlar ON sinav.SinavID = notlar.SinavID
GROUP BY sinav.SinavID;

SELECT bolum.BolumAdi, MAX(notlar.OgrenciNotu) AS max_not
FROM bolum
INNER JOIN ogrenci ON bolum.BolumID = ogrenci.BolumID
INNER JOIN kayit ON ogrenci.OgrenciID = kayit.OgrenciID
INNER JOIN notlar ON kayit.KayitID = notlar.KayitID
GROUP BY bolum.BolumAdi;

SELECT ogrenci.Adi, ogrenci.Soyadi, ders.DersAdi
FROM ogrenci
INNER JOIN kayit ON ogrenci.OgrenciID = kayit.OgrenciID
INNER JOIN ders ON kayit.DersID = ders.DersID
WHERE ders.DersAdi = 'Matematik';

SELECT ogrenci.Adi, ogrenci.Soyadi, sinav.SinavID, sinav.DersID, sinav.Yer, sinav.Saat,
ders.DersAdi
FROM ogrenci
INNER JOIN kayit ON ogrenci.OgrenciID = kayit.OgrenciID
INNER JOIN sinav ON kayit.DersID = sinav.DersID
INNER JOIN ders ON sinav.DersID = ders.DersID

SELECT bolum.Fakulte, COUNT(ogrenci.OgrenciID) AS ogrenci_sayisi
FROM bolum
INNER JOIN ogrenci ON bolum.BolumID = ogrenci.BolumID
GROUP BY bolum.Fakulte