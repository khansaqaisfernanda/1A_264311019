INSERT INTO pengguna (nama_pengguna, peran, email)
VALUES
    ('Dr. Siti Aminah, S.Gz', 'Ahli Gizi', 'siti.aminah@mbg.go.id'),
    ('Budi Prasetyo', 'Petugas Input', 'budi.prasetyo@mbg.go.id'),
    ('Admin Sistem', 'Admin', 'admin@mbg.go.id');

INSERT INTO menu_harian (nama_menu, tanggal_menu, id_pengguna_penyusun, id_pengguna_penginput)
VALUES
    ('Nasi Ayam Teriyaki + Sayur Sop + Buah Pisang + Susu UHT', '2026-10-18', 1, 2),
    ('Nasi Ikan Tongkol Balado + Tumis Kangkung + Buah Jeruk + Susu UHT', '2026-10-19', 1, 2),
    ('Nasi Telur Dadar + Sayur Bayam Bening + Buah Apel + Susu UHT', '2026-10-20', 1, 2);

INSERT INTO perubahan_menu (id_menu, alasan_perubahan, status_validasi, tanggal_pengajuan, tanggal_validasi, id_pengaju, id_validator)
VALUES
    (1, 'Stok ayam habis, diganti dengan ikan tongkol', 'Disetujui', '2026-10-17', '2026-10-17', 2, 1),
    (2, 'Kangkung tidak segar, diganti bayam', 'Diajukan', '2026-10-18', NULL, 2, NULL),
    (3, 'Menambah variasi buah menjadi mangga', 'Ditolak', '2026-10-19', '2026-10-19', 2, 1);


SELECT * FROM pengguna;


UPDATE perubahan_menu
SET status_validasi  = 'Disetujui',
    tanggal_validasi = '2026-10-20',
    id_validator     = 1
WHERE id_perubahan = 2;


DELETE FROM perubahan_menu
WHERE id_perubahan = 3;
