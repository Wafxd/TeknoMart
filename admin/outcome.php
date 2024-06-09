<?php
include '../db/koneksi.php';
$tanggal_awal = $_GET['tanggal_awal'] ?? '';
$tanggal_akhir = $_GET['tanggal_akhir'] ?? '';
$data = query("SELECT 
            tb_pengeluaran.tanggal, 
            (SELECT nama_barang FROM tb_barang WHERE tb_barang.id_barang = tb_pengeluaran.id_barang) AS nama_barang,
            tb_pengeluaran.harga, 
            tb_pengeluaran.qty,
            SUM(tb_pengeluaran.harga * tb_pengeluaran.qty) AS pengeluaran 
        FROM tb_pengeluaran
        WHERE tb_pengeluaran.tanggal BETWEEN '$tanggal_awal' AND '$tanggal_akhir'
        GROUP BY tb_pengeluaran.tanggal");

$filename = 'Pengeluaran' . $tanggal_awal . '-' . $tanggal_akhir . '.csv';
header('Content-Type: text/csv');
header('Content-Disposition: attachment; filename="' . $filename . '"');
$output = fopen('php://output', 'w');
fputcsv($output, array('Tanggal', 'Product', 'Harga Beli', 'Qty','Pengeluaran'));
foreach ($data as $row) {
    fputcsv($output, $row);
}
fclose($output);
exit;
?>
