CREATE DATABASE hastane;
CREATE TABLE calisanlar(
calisan_id INT PRIMARY KEY,
calisan_adi VARCHAR(255) NOT NULL,
calisan_soyadi VARCHAR(255) NOT NULL,
pozisyon VARCHAR(255) NOT NULL
);
CREATE TABLE doktorlar(
doktor_id INT PRIMARY KEY,
departman VARCHAR(255) NOT NULL,
calisan_id INT,
FOREIGN KEY (calisan_id) REFERENCES calisanlar(calisan_id)
);
CREATE TABLE hastalar(
hasta_id INT PRIMARY KEY,
hasta_adi VARCHAR(255) NOT NULL,
hasta_soyadi VARCHAR(255) NOT NULL,
dogum_gunu DATE NOT NULL,
cinsiyet boolean NOT NULL,
kan_grubu VARCHAR(255) NOT NULL
);
CREATE TABLE randevular(
randevu_id INT PRIMARY KEY,
hasta_id INT,
FOREIGN KEY (hasta_id) REFERENCES hastalar(hasta_id),
doktor_id INT,
FOREIGN KEY (doktor_id) REFERENCES doktorlar(doktor_id),
randevu_gunu DATE NOT NULL,
randevu_saati TIME NOT NULL
);
CREATE TABLE medikal_islemler(
med_id INT PRIMARY KEY,
med_adi VARCHAR(255) NOT NULL,
sonuc boolean NOT NULL,
randevu_id INT,
FOREIGN KEY (randevu_id) REFERENCES randevular(randevu_id)
);

INSERT INTO calisanlar (calisan_id, calisan_adi, calisan_soyadi, pozisyon)
VALUES
(1, 'John', 'Doe', 'Doktor'),
(2, 'Jane', 'Smith', 'Doktor'),
(3, 'Robert', 'Johnson', 'Doktor'),
(4, 'Emily', 'Williams', 'Doktor'),
(5, 'Michael', 'Brown', 'Doktor'),
(6, 'Olivia', 'Davis', 'Doktor'),
(7, 'Daniel', 'Taylor', 'Doktor'),
(8, 'Sophia', 'Miller', 'Doktor'),
(9, 'Matthew', 'Wilson', 'Doktor'),
(10, 'Emma', 'Moore', 'Doktor'),
(11, 'Sophie', 'Anderson', 'Pazarlama Uzmanı'),
(12, 'Liam', 'Johnson', 'Yazılım Mühendisi'),
(13, 'Olivia', 'Davis', 'İK Koordinatörü'),
(14, 'Noah', 'Moore', 'Finans Analisti'),
(15, 'Ava', 'Williams', 'Müşteri Destek Uzmanı'),
(16, 'Emma', 'Miller', 'Satış Müdürü'),
(17, 'Mia', 'Taylor', 'Grafik Tasarımcı'),
(18, 'Ethan', 'Brown', 'IT Uzmanı'),
(19, 'Isabella', 'Smith', 'Proje Koordinatörü'),
(20, 'Lucas', 'Wilson', 'Operasyonlar Müdürü');

INSERT INTO doktorlar (doktor_id, departman, calisan_id)
VALUES
(1, 'Kardiyoloji', 2),
(2, 'Ortopedik Cerrah', 5),
(3, 'Pediatri', 7),
(4, 'Dermatoloji', 1),
(5, 'Nöroloji', 3),
(6, 'Gastroenteroloji', 9),
(7, 'Göz Hastalıkları', 4),
(8, 'Psikiyatri', 6),
(9, 'Üroloji', 8),
(10, 'Endokrinoloji', 10);

INSERT INTO hastalar (hasta_id, hasta_adi, hasta_soyadi, dogum_gunu, cinsiyet,
kan_grubu)
VALUES
(1, 'Alice', 'Johnson', '1990-03-15', true, 'A+'),
(2, 'David', 'Smith', '1985-07-22', false, 'B-'),
(3, 'Sophie', 'Brown', '2000-01-10', true, 'O+'),
(4, 'Liam', 'Taylor', '1998-05-05', false, 'AB+'),
(5, 'Ava', 'Miller', '1982-11-30', true, 'A-'),
(6, 'Noah', 'Wilson', '1995-09-18', false, 'B+'),
(7, 'Emma', 'Davis', '1988-12-03', true, 'O-'),
(8, 'Mia', 'Moore', '1992-04-25', true, 'AB-'),
(9, 'Ethan', 'Williams', '1993-08-12', false, 'A+'),
(10, 'Olivia', 'Anderson', '1997-06-08', true, 'B-');

INSERT INTO randevular (randevu_id, hasta_id, doktor_id, randevu_gunu, randevu_saati)
VALUES
(1, 3, 1, '2023-03-20', '10:00:00'),
(2, 8, 4, '2023-04-15', '14:30:00'),
(3, 5, 7, '2023-05-02', '11:15:00'),
(4, 2, 2, '2023-06-10', '16:45:00'),
(5, 10, 9, '2023-07-08', '09:30:00'),
(6, 1, 5, '2023-08-22', '13:00:00'),
(7, 6, 8, '2023-09-17', '15:45:00'),
(8, 7, 3, '2023-10-05', '12:30:00'),
(9, 9, 6, '2023-11-12', '08:45:00'),
(10, 4, 10, '2023-12-20', '17:00:00');

INSERT INTO medikal_islemler (med_id, med_adi, sonuc, randevu_id)
VALUES
(1, 'Blood Test', true, 8),
(2, 'MRI Scan', false, 6),
(3, 'X-ray', true, 4),
(4, 'Ultrasonography', false, 5),
(5, 'Echocardiogram', true, 1),
(6, 'Skin Biopsy', true, 2),
(7, 'Endoscopy', false, 9),
(8, 'Cataract Surgery', true, 3),
(9, 'Psychological Assessment', true, 7),
(10, 'Thyroid Function Test', false, 10);
SELECT randevular.randevu_id, hastalar.hasta_adi, hastalar.hasta_soyadi,
calisanlar.calisan_adi, calisanlar.calisan_soyadi, doktorlar.departman
FROM randevular
JOIN hastalar ON randevular.hasta_id = hastalar.hasta_id
JOIN doktorlar ON randevular.doktor_id = doktorlar.doktor_id
JOIN calisanlar ON doktorlar.calisan_id = calisanlar.calisan_id;


SELECT doktorlar.doktor_id, doktorlar.departman, calisanlar.calisan_adi,
calisanlar.calisan_soyadi
FROM doktorlar
JOIN calisanlar ON doktorlar.calisan_id = calisanlar.calisan_id;

SELECT doktorlar.doktor_id, doktorlar.departman, hastalar.hasta_adi,
hastalar.hasta_soyadi
FROM doktorlar
JOIN randevular ON doktorlar.doktor_id = randevular.doktor_id
JOIN hastalar ON randevular.hasta_id = hastalar.hasta_id;

SELECT hastalar.hasta_id, hastalar.hasta_adi, hastalar.hasta_soyadi,
hastalar.dogum_gunu, hastalar.cinsiyet, hastalar.kan_grubu, doktorlar.departman
FROM hastalar
JOIN randevular ON hastalar.hasta_id = randevular.hasta_id
JOIN doktorlar ON randevular.doktor_id = doktorlar.doktor_id
WHERE hastalar.cinsiyet = false AND hastalar.kan_grubu = 'A+';

SELECT hastalar.hasta_id, hastalar.hasta_adi, hastalar.hasta_soyadi,
medikal_islemler.sonuc, COUNT(*) as hasta_sayisi
FROM medikal_islemler
JOIN randevular ON randevular.randevu_id = medikal_islemler.randevu_id
JOIN hastalar ON randevular.hasta_id = hastalar.hasta_id
WHERE medikal_islemler.sonuc = true
