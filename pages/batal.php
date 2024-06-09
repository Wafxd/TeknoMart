<?php 
include "../db/koneksi.php";

$order = $_GET["id"];

$barang = query("SELECT * FROM details 
                INNER JOIN tb_barang USING(id_barang)
                WHERE id_orders = '$order'");

foreach ($barang as $bg) {
  $id_barang = $bg["id_barang"];
  $qty = $bg["qty"];
  $stok_result = mysqli_query($conn, "SELECT * FROM tb_barang WHERE id_barang = '$id_barang'");
  $stok = mysqli_fetch_assoc($stok_result);
  $min_stok = $stok["stok"] + $qty;

  // Update stok barang
  $update_result = mysqli_query($conn, "UPDATE tb_barang SET stok = '$min_stok' WHERE id_barang = '$id_barang'");
}
$batal = batal($order);

if ($batal) {
  echo "<script>
        alert('Pesanan Berhasil Dibatalkan');
        document.location.href = 'pesanan.php';
        </script>";
}

?>