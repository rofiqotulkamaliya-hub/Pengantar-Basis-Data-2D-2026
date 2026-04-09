CREATE DATABASE db_klinik;
USE db_klinik;

CREATE TABLE dokter (
id_dokter INT PRIMARY KEY,
nama_dokter VARCHAR(100),
spesialisasi VARCHAR(100)
);

CREATE TABLE pasien (
id_pasien INT PRIMARY KEY,
nama_pasien VARCHAR(100),
tanggal_lahir DATE,
no_telepon VARCHAR(15)
);

CREATE TABLE rekam_medis (
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis VARCHAR(200),

FOREIGN KEY (id_pasien)
  REFERENCES pasien (id_pasien)
  ON DELETE RESTRICT,
  
FOREIGN KEY (id_dokter)
  REFERENCES dokter (id_dokter)
  ON DELETE RESTRICT
);

INSERT INTO dokter VALUES
  (1, 'Dr. Andi', 'Umum'),
  (2, 'Dr. Budi', 'Gigi');
  
INSERT INTO pasien VALUES
  (1, 'Siti', '2000-05-10', '08123456789'),
  (2, 'Rita', '1998-08-20', '08234567890');
  
INSERT INTO rekam_medis VALUES
  (1, 1, 1, '2024-01-10', 'Demam'),
  (2, 2, 2, '2024-01-11', 'Sakit gigi');
  
INSERT INTO rekam_medis VALUES
  (3, 1, 99, '2024-01-12', 'Flu');
  
UPDATE pasien
SET no_telepon = '08987654321'
WHERE id_pasien = 1;

UPDATE dokter
SET spesialisasi = 'Penyakit Dalam'
WHERE id_dokter = 1;

DELETE FROM rekam_medis
WHERE id_rekam = 1;

CREATE TABLE rekam_medis (
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis VARCHAR(200),

FOREIGN KEY (id_pasien)
  REFERENCES pasien (id_pasien)
  ON DELETE RESTRICT,

FOREIGN KEY (id_dokter)
  REFERENCES dokter (id_dokter)
  ON DELETE CASCADE
);

INSERT INTO rekam_medis VALUES
  (1, 1, 1, '2024-01-10', 'Demam'),
  (2, 2, 1, '2024-01-11', 'Flu');
  
DELETE FROM dokter
  WHERE id_dokter = 1;
 
SELECT * FROM rekam_medis;

CREATE TABLE rekam_medis (
id_rekam INT PRIMARY KEY,
id_pasien INT,
id_dokter INT,
tanggal_periksa DATE,
diagnosis VARCHAR(200),

FOREIGN KEY (id_pasien)
  REFERENCES pasien (id_pasien)
  ON DELETE RESTRICT,
  
FOREIGN KEY (id_dokter)
  REFERENCES dokter (id_dokter)
  ON DELETE RESTRICT
);

INSERT INTO rekam_medis VALUES
  (1, 1, 1, '2024-01-10', 'Demam'),
  (2, 2, 2, '2024-01-11', 'Flu');
  
TRUNCATE TABLE rekam_medis;

TRUNCATE TABLE pasien;