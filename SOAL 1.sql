CREATE TABLE pengguna (
    id_pengguna     INT             PRIMARY KEY AUTO_INCREMENT,
    nama_pengguna   VARCHAR(100)    NOT NULL,
    peran           ENUM('Ahli Gizi', 'Petugas Input',
                        'Admin', 'Kepala Sekolah')
                                    NOT NULL,
    email           VARCHAR(100)    UNIQUE,
    created_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE menu_harian (
    id_menu                 INT             PRIMARY KEY AUTO_INCREMENT,
    nama_menu               VARCHAR(150)    NOT NULL,
    tanggal_menu            DATE            NOT NULL,
    id_pengguna_penyusun    INT             NOT NULL
        COMMENT 'FK -> Pengguna yang menyusun menu',
    id_pengguna_penginput   INT             NULL
        COMMENT 'FK -> Pengguna yang menginput menu',

    CONSTRAINT fk_menu_penyusun
        FOREIGN KEY (id_pengguna_penyusun)
        REFERENCES pengguna (id_pengguna)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_menu_penginput
        FOREIGN KEY (id_pengguna_penginput)
        REFERENCES pengguna (id_pengguna)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE perubahan_menu (
    id_perubahan        INT             PRIMARY KEY AUTO_INCREMENT,
    id_menu             INT             NOT NULL,
    alasan_perubahan    TEXT            NOT NULL,
    status_validasi     ENUM('Diajukan', 'Disetujui', 'Ditolak')
                                        NOT NULL DEFAULT 'Diajukan',
    tanggal_pengajuan   DATE            NOT NULL,
    tanggal_validasi    DATE            NULL,
    id_pengaju          INT             NOT NULL
        COMMENT 'FK -> Pengguna yang mengajukan',
    id_validator        INT             NULL
        COMMENT 'FK -> Pengguna yang memvalidasi',

    CONSTRAINT fk_perubahan_menu
        FOREIGN KEY (id_menu)
        REFERENCES menu_harian (id_menu)
        ON DELETE CASCADE ON UPDATE CASCADE,

    CONSTRAINT fk_perubahan_pengaju
        FOREIGN KEY (id_pengaju)
        REFERENCES pengguna (id_pengguna)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    -- FK ke Tabel Induk 1: pengguna (validator)
    CONSTRAINT fk_perubahan_validator
        FOREIGN KEY (id_validator)
        REFERENCES pengguna (id_pengguna)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO pengguna (nama_pengguna, peran, email)
VALUES
    ('Dr. Siti Aminah, S.Gz', 'Ahli Gizi',
     'siti.aminah@mbg.go.id'),
    ('Hj. Ratna Dewi, M.Pd', 'Kepala Sekolah',
     'ratna.dewi@mbg.go.id'),
    ('Admin Sistem', 'Admin',
     'admin@mbg.go.id');


INSERT INTO menu_harian
    (nama_menu, tanggal_menu, id_pengguna_penyusun, id_pengguna_penginput)
VALUES
    ('Nasi Ayam Teriyaki + Sayur Sop + Buah Pisang + Susu UHT',
     '2026-10-18', 1, 2),
    ('Nasi Ikan Tongkol Balado + Tumis Kangkung + Buah Jeruk + Susu UHT',
     '2026-10-19', 1, 2),
    ('Nasi Telur Dadar + Sayur Bayam Bening + Buah Apel + Susu UHT',
     '2026-10-20', 1, 2);

INSERT INTO perubahan_menu
    (id_menu, alasan_perubahan, status_validasi,
     tanggal_pengajuan, tanggal_validasi, id_pengaju, id_validator)
VALUES
    (1, 'Stok ayam habis, diganti dengan ikan tongkol',
     'Disetujui', '2026-10-17', '2026-10-17', 2, 1),
    (2, 'Kangkung tidak segar, diganti bayam',
     'Diajukan', '2026-10-18', NULL, 2, NULL),
    (3, 'Menambah variasi buah menjadi mangga',
     'Ditolak', '2026-10-19', '2026-10-19', 2, 1);

SELECT * FROM pengguna;
