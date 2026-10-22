Nama : Khansa Qais Fernanda
NIM : 264311019
Kelas : 1A
Mata Kuliah : Praktikum Basis Data
Topik Proyek: Sistem Manajemen Program Makan Bergizi Gratis (MBG)
Daftar File Jawaban

Repository ini berisi kode SQL untuk masing-masing butir soal UTS Praktikum Basis Data:

Nama File	Deskripsi Soal	Bobot
soal1.sql	Data Definition & Relasi (DDL): Sintaks CREATE TABLE untuk 3 tabel berelasi (pengguna, menu_harian, perubahan_menu) dengan Primary Key & Foreign Key.
soal2.sql	Operasi CRUD Dasar: Manipulasi data menggunakan INSERT (9 baris), SELECT *, UPDATE dengan klausa WHERE, dan DELETE dengan klausa WHERE.
soal3.sql	Query Kompleks & Agregasi Laporan: Query SQL tunggal yang menggabungkan klausa SELECT, JOIN, WHERE, dan GROUP BY dengan fungsi agregat.

3 Tabel yang Dipilih
pengguna (Tabel Induk 1) — Menyimpan data master pengguna sistem.
menu_harian (Tabel Induk 2) — Menyimpan data master rancangan menu harian.
perubahan_menu (Tabel Transaksi/Anak) — Mencatat transaksi perubahan menu yang terhubung via Foreign Key ke pengguna dan menu_harian.
