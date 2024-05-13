CREATE TABLE departman(
departman_id INT PRIMARY KEY,
departman_adi VARCHAR(255)
);
CREATE TABLE calisan (
calisan_id INT PRIMARY KEY,
calisan_adi VARCHAR(255),
departman_id INT,
FOREIGN KEY (departman_id) REFERENCES departman (departman_id)
);

CREATE TABLE proje (
proje_id INT PRIMARY KEY,
proje_adi VARCHAR(255),
departman_id id INT,
FOREIGN KEY (departman_id) REFERENCES departman (departman_id)
);

CREATE TABLE gorev (
gorev_id INT PRIMARY KEY,
gorev_adi VARCHAR(255),
proje_id INT,
calisan_id INT,
FOREIGN KEY (proje_id) REFERENCES proje(proje_id),
FOREIGN KEY (calisan_id) REFERENCES calisan(calisan_id)
);

INSERT INTO departman (departman_id, departman_adi) VALUES
(1, 'IT'),
(2, 'Finance'),
(3, 'Marketing'),
(4, 'HR');

INSERT INTO calisan (calisan_id, calisan_adi, departman_id) VALUES
(101, 'John Doe', 1),
(102, 'Jane Smith', 2),
(103, 'Bob Johnson', 1),
(104, 'Alice Brown', 3),
(105, 'Charlie White', 2),
(106, 'David Miller', 1),
(107, 'Eva Davis', 4),
(108, 'Frank Wilson', 2),
(109, 'Grace Taylor', 3),
(110, 'Henry Anderson', 4);

INSERT INTO proje (proje_id, proje_adi, departman_id) VALUES
(201, 'Project A', 1),
(202, 'Project B', 2),
(203, 'Project C', 3),
(204, 'Project D', 4);

INSERT INTO gorev (gorev_id, gorev_adi, proje_id, calisan_id) VALUES
(301, 'Task 1', 201, 101),
(302, 'Task 2', 202, 102),
(303, 'Task 3', 203, 103),
(304, 'Task 4', 204, 104),
(305, 'Task 5', 201, 105),
(306, 'Task 6', 202, 106),
(307, 'Task 7', 203, 107),
(308, 'Task 8', 204, 108),
(309, 'Task 9', 201, 109),
(310, 'Task 10', 202, 110);

SELECT calisan_adi FROM calisan WHERE departman_id = 1;

SELECT departman_id, COUNT(calisan_id) AS calisan_say FROM calisan GROUP BY
departman_id;

SELECT calisan_adi, departman_adi FROM calisan
JOIN departman ON calisan.departman_id = departman.departman_id

SELECT calisan_adi, proje_adi FROM calisan
JOIN gorev ON calisan.calisan_id = gorev.calisan_id
JOIN proje ON gorev.proje_id = proje.proje_id;

SELECT departman.departman_adi, COUNT(calisan.calisan_id) AS calisan_say
FROM departman
INNER JOIN calisan ON departman.departman_id = calisan.departman_id
GROUP BY departman.departman_adi;

SELECT gorev.gorev_adi, calisan.calisan_adi, departman.departman_adi
FROM gorev
INNER JOIN calisan ON gorev.calisan_id = calisan.calisan_id
INNER JOIN departman ON calisan.departman_id = departman.departman_id;

SELECT calisan.calisan_adi
FROM calisan
LEFT JOIN gorev ON calisan.calisan_id = gorev.calisan_id
WHERE gorev.gorev_id IS NULL; 