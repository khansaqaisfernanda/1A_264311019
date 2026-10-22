SELECT
    p.nama_pengguna             AS nama_pengaju,
    COUNT(pm.id_perubahan)      AS jumlah_perubahan,
    MIN(mh.tanggal_menu)        AS menu_terlama,
    MAX(mh.tanggal_menu)        AS menu_terbaru
FROM perubahan_menu pm
JOIN pengguna p
    ON pm.id_pengaju = p.id_pengguna
JOIN menu_harian mh
    ON pm.id_menu = mh.id_menu
WHERE pm.status_validasi = 'Disetujui'
GROUP BY p.nama_pengguna;
