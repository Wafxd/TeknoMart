<?php
include '../db/koneksi.php';
$tanggal_awal = $_GET['tanggal_awal'] ?? '';
$tanggal_akhir = $_GET['tanggal_akhir'] ?? '';
$data = query("SELECT orders.tanggal, SUM(details.harga_satuan * details.qty) AS pemasukan 
                  FROM orders
                  INNER JOIN details using(id_orders)
                  WHERE orders.tanggal BETWEEN '$tanggal_awal' AND '$tanggal_akhir'
                  GROUP BY orders.tanggal");

$filename = 'Pendapatan' . $tanggal_awal . '-' . $tanggal_akhir . '.csv';
header('Content-Type: text/csv');
header('Content-Disposition: attachment; filename="' . $filename . '"');
$output = fopen('php://output', 'w');
fputcsv($output, array('Tanggal', 'Pemasukan',));
foreach ($data as $row) {
    fputcsv($output, $row);
}
fclose($output);
exit;
?>