CREATE database kutuphane

CREATE TABLE kitaplar (
KitapID INT PRIMARY KEY,
KitapAdi VARCHAR(50),
Yazar VARCHAR(50),
YayinTarihi INT,
ISBN INT,
StokMiktari INT
);

CREATE TABLE uyeler (
UyeID INT PRIMARY KEY,
Ad VARCHAR(50),
Soyad VARCHAR(50),
Telefon INT,
Adres VARCHAR(50)
);

CREATE TABLE oduncalınankitaplar (
OduncID INT PRIMARY KEY,
UyeID INT,
KitapID INT,
FOREIGN KEY (UyeID) REFERENCES uyeler (UyeID),
FOREIGN KEY (KitapID) REFERENCES kitaplar (KitapID),
AlmaTarihi VARCHAR(50),
VermeTarihi VARCHAR(50)
);

INSERT INTO kitaplar (KitapID, KitapAdi, Yazar, YayinTarihi, ISBN, StokMiktari)
VALUES
(1, 'Harry Potter ve Felsefe Taşı', 'J.K. Rowling', 1997, 978, 7),
(2, 'Da Vinci Şifresi', 'Dan Brown', 2003, 979, 1),
(3, 'Harry Potter ve Zümrüdüanka Yoldaşlığı', 'J.K. Rowling', 2003, 978, 5),
(4, '1984', 'George Orwell', 1949, 978, 3),
(5, 'Diana: Her Gerçek Hikayesi', 'Andrew Morton', 1997, 979, 3);

INSERT INTO uyeler (UyeID, Ad, Soyad, Telefon, Adres)
VALUES
(1, 'Ahmet', 'Yılmaz', '5551', 'İzmir, Türkiye'),
(2, 'Mehmet', 'Kaya', '5559', 'İstanbul, Türkiye'),
(3, 'Ayşe', 'Demir', '5555', 'İzmir, Türkiye'),
(4, 'Ayşe', 'Şahin', '5553', 'Bursa, Türkiye'),
(5, 'Mustafa', 'Aksoy', '5554', 'İstanbul, Türkiye');

INSERT INTO oduncalınankitaplar (OduncID, UyeID, KitapID, AlimTarihi, IadeTarihi)
VALUES
(1, 1, 2, '2023-11-01', '2023-11-15'),
(2, 3, 4, '2023-11-03', '2023-11-17'),
(3, 4, 5, '2023-11-05', '2023-11-20'),
(4, 2, 3, '2023-11-08', '2023-11-22'),
(5, 5, 1, '2023-11-10', '2023-11-25');

SELECT * FROM kitaplar WHERE YayinTarihi = 1997;
SELECT * FROM kitaplar WHERE Yazar = 'J.K. Rowling';
SELECT * FROM kitaplar WHERE Yazar = 'J.K. Rowling';
SELECT * FROM uyeler WHERE Adres = "İstanbul, Türkiye";
SELECT * FROM uyeler WHERE Ad = 'Ayşe';
SELECT * FROM oduncalınankitaplar WHERE UyeID = 1;
SELECT * FROM oduncalınankitaplar WHERE VermeTarihi < '2023-11-20';
SELECT * FROM kitaplar WHERE StokMiktari = 3;
SELECT Telefon FROM uyeler;