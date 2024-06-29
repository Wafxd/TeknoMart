<?php 
include "../db/koneksi.php";
$id_orders = $_GET["id"];
$orders = query("SELECT * FROM orders 
                  inner join metode using(id_metode) 
                  inner join jasa_kirim using(id_jasa)
                  WHERE id_orders = '$id_orders'")[0];
$details = query("SELECT * FROM details 
                  inner join tb_barang using(id_barang) WHERE id_orders = '$id_orders'");

$total = 0;
foreach ($details as $dt) {
  $total_harga = $dt["harga_satuan"] * $dt["qty"];
  $total += $total_harga;
  
}

$barang = query("SELECT * FROM details 
                inner join tb_barang using(id_barang)
                WHERE id_orders = '$id_orders'");

// $stok = query("SELECT * FROM tb_barang");


if (isset($_POST["kirim"])) {
  if (!empty($_FILES["bukti"]["name"])) {
    if (upbukti($_POST) > 0) {
      foreach ($barang as $bg) {
        $id_barang = $bg["id_barang"];
        $qty = $bg["qty"];
        $stok_result = mysqli_query($conn, "SELECT * FROM tb_barang WHERE id_barang = '$id_barang'");
        $stok = mysqli_fetch_assoc($stok_result);
        $terjual = $stok["terjual"] + $qty;
        
        $update_result = mysqli_query($conn, "UPDATE tb_barang SET terjual = '$terjual' WHERE id_barang = '$id_barang'");
      }
      
      echo "<script>
        alert('Pembayaran Berhasil');
        window.location.href = 'pesanan.php';
      </script>";
    } else {
      echo "<script>
          alert('Pembayaran Gagal');
      </script>";
  }
  } else {
    echo "<script>
      alert('Data Wajib Diisi');
      history.back();
    </script>";
  }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/pembayaran.css">
</head>
<body>
  <?php 
  $total += $orders["harga_jasa"];
  $total += $orders["harga_admin"];
  ?>
  <div class="container text-center pt-5">
    <div class="container">
      <div class="container">
        <img src="../<?=$orders["qr"] ?>" alt="" width="350">
        <p style="font-size : 16px">No Rekening : <?= $orders["va"] ?> <span>(<?= $orders["nama_metode"] ?>)</span></p>
      </div>
      <div class="container pt-3 pb-5">
        <form method="post" enctype="multipart/form-data">
          <input type="hidden" name="id_orders" value="<?= $id_orders ?>">
          <div class="row">
            <div class="col">
              <input type="file" name="bukti" class="form-control" style="padding:11px">
            </div>
            <div class="col-1">
              <button class="btn btn-success btn-lg" type="submit" name="kirim">Kirim</button>
            </div>
          </div>
        </form>
        <div class="container pt-4">
          <a href="pesananstatus.php?status1=Belum Bayar" class="btn btn-warning">Bayar Nanti</a>
        </div>
      </div>
      <div class="container pt-2 mb-5" style="border: 1px dashed #000 ; background-color : white ; border-radius: 5px">
        <h3>Cara Pembayaran</h3>
        <div class="container pt-3 pb-3" style="text-align:left">
          <ul>
            <li><p style="font-size : 18px">Buka Aplikasi Sesuai Dengan Metode Pembayaran (<span style="color:red"><?= $orders["nama_metode"] ?></span>)</p></li>
            <li><p style="font-size : 18px">Silahkan Scan Qr Code Yang Tertera</p></li>
            <li><p style="font-size : 18px"> Silahkan Isi Jumlah Pembayaran Sesuai Dengan Total Pembayaran (<span style="color:red"><?= rupiah($total) ?></span>)</p></li>
            <li><p style="font-size : 18px">Screenshoot Bukti Pembayaran</p></li>
            <li><p style="font-size : 18px">Lalu Upload Bukti Pembayaran di form input yang telah disediakan</p></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</body>
</html>