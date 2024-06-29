<?php 
session_start();
include "../db/koneksi.php";


if (isset($_SESSION['id_user']) && isset($_SESSION['username'])) {
  $id_user = $_SESSION['id_user'];
  $username = $_SESSION["username"];
  $nama = query("SELECT nama FROM tb_user WHERE id_user = '$id_user'")[0];
} else {
  $id_user = null;
  $username = null;
  $nama = null;
}

$status1 = isset($_GET["status1"]) ? $_GET["status1"] : null;
$status2 = isset($_GET["status2"]) ? $_GET["status2"] : null;

$query = "SELECT *, orders.tanggal FROM orders 
          INNER JOIN jasa_kirim USING(id_jasa) 
          INNER JOIN metode USING(id_metode) 
          left JOIN tb_refund using(id_orders)
          WHERE orders.id_user = '$id_user'";

if ($status1 && $status2) {
    $query .= " AND (orders.status = '$status1' OR orders.status = '$status2')";
} elseif ($status1) {
    $query .= " AND orders.status = '$status1'";
} elseif ($status2) {
    $query .= " AND orders.status = '$status2'";
}

$order = query($query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pesanan</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/navbar.css">
  <link rel="stylesheet" href="../css/pesanan.css">
  
</head>
<body>
  <!-- 8AC7FF -->
  <nav class="navbar navbar-expand-lg" style="background-color: #6fc3ff;">
    <div class="container-fluid">
      <a class="navbar-brand" href="../index.php" style="padding-left: 50px">
        <img src="../assets/icon/logo.png" alt="Techno" width="70" height="70" class="d-inline-block">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <form class="d-flex ms-auto" role="search" action="search_product.php" method="GET">
          <input class="form-control me-2" type="search" name="search_query" placeholder="Search" aria-label="Search">
      </form>
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="navbar-brand" href="keranjang.php">
              <img src="../assets/icon/cart.png" alt="Logo" width="30" height="25" class="d-inline-block align-text-top">
            </a>
          </li>
        </ul>
        <?php 
        if (!isset($_SESSION["id_user"])) {
        ?>
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0" style="padding-right:20px">
          <li class="nav-item-login">
            <a class="nav-link" aria-current="page" href="login.php">LOGIN</a>
          </li>
        </ul>
        <?php 
        } else {
        ?>
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item" id="dropdownContainer">
              <div class="dropdown" id="dropdown">
                <button class="dropbtn" id="dropdownBtn" style="margin-right : 30px"><img src="../assets/icon/profile.png" alt="" height=25 width=25><span style="margin-left:10px"><?= $username ?></span></button>
                <div class="dropdown-content" id="dropdownContent">
                  <a href="pesanan.php">Pesanan</a>
                  <a href="profile.php">Profile</a>
                  <a href="logout.php" onclick="return confirm('Apakah anda yakin ingin Logout?')">Logout</a>
                </div>
              </div>
            </li>
          </ul>
        <?php }?>
      </div>
    </div>
  </nav>
  
  <div class="container p-3 mt-5" >
    <div class="container text-center mb-5">
      <?php if ($status1 == "Diajukan Retur"){?>
        <h1><span style="color: #38a0ff"><?= $status1 ?></span></h1>
      <?php }else{?>
        <h1>Pesanan <span style="color: #38a0ff"><?= $status1 ?></span></h1>
      <?php }?>
    </div>
    <div class="container status-container mb-3">
      <div class="row justify-content-around">
        <div class="col-auto status-item">
          <a href="pesananstatus.php?status1=Belum Bayar">
            <img src="../assets/icon/dompet.png" alt="Belum Bayar" class="status-icon">
            <div class="status-text">Belum Bayar</div>
          </a>
        </div>
        <div class="col-auto status-item">
          <a href="pesananstatus.php?status1=Diproses&status2=Menunggu Konfirmasi">
            <img src="../assets/icon/proses.png" alt="Diproses" class="status-icon">
            <div class="status-text">Diproses</div>
          </a>
        </div>
        <div class="col-auto status-item">
          <a href="pesananstatus.php?status1=Dikirim">
            <img src="../assets/icon/delivery.png" alt="Dikirim" class="status-icon">
            <div class="status-text">Dikirim</div>
          </a>
        </div>
        <div class="col-auto status-item">
          <a href="pesananstatus.php?status1=Selesai&status2=Retur">
            <img src="../assets/icon/selesai.png" alt="Selesai" class="status-icon">
            <div class="status-text">Selesai</div>
          </a>
        </div>
        <div class="col-auto status-item">
          <a href="pesananstatus.php?status1=Dibatalkan">
            <img src="../assets/icon/cancelled.png" alt="Dibatalkan" class="status-icon">
            <div class="status-text">Dibatalkan</div>
          </a>
        </div>
        <div class="col-auto status-item">
          <a href="pesananstatus.php?status1=Diajukan Retur&status2=Retur">
            <img src="../assets/icon/refund.png" alt="Pengembalian" class="status-icon">
            <div class="status-text">Pengajuan Pengembalian</div>
          </a>
        </div>
      </div>
    </div>
  <?php 
    foreach ($order as $ord) {
      $total = 0;
      $total_harga = 0;
      
      $id_orders = $ord["id_orders"];
      $det = query("SELECT * FROM details inner join tb_barang on details.id_barang = tb_barang.id_barang WHERE id_orders = '$id_orders'")[0];
      $harga = query("SELECT * FROM orders 
                      inner join details using(id_orders) 
                      inner join tb_barang using(id_barang) 
                      inner join jasa_kirim using(id_jasa) 
                      inner join metode using(id_metode)  
                      WHERE orders.id_orders = '$id_orders'");

      $produk = COUNT($harga);
      foreach ($harga as $hrg) {
        $subtotal = $hrg["harga_satuan"] * $hrg["qty"];
        $total_harga += $subtotal;
        $total += $subtotal; 
      }
      $total += $ord["harga_jasa"] + $ord["harga_admin"];
    
  ?>
    <div class="container p-3 mb-3" style="background-color : white ; border-radius:8px">
      <div class="container order-container">
        <div class="row align-items-center">
          <div class="col-auto">
            <p class="mb-0">
              <img src="../assets/icon/bag.png" alt="Belanja" class="order-icon"> Belanja
            </p>
          </div>
          <div class="col-2">
            <p class="mb-0 order-date"><?= $ord["tanggal"] ?></p>
          </div>
          <?php if ($ord["status"] == "Diajukan Retur") { ?>
            <div class="col">
              <p class="mb-0 order-status order-status-red">
                <?= $ord["status"] ?> : <span class="order-status-refund"><?= $ord["status_refund"] ?></span>
              </p>
            </div>
          <?php } elseif ($ord["status"] == "Selesai") { ?>
            <div class="col">
              <p class="mb-0 order-status order-status-green"><?= $ord["status"] ?></p>
            </div>
          <?php } elseif($ord["status"] == "Retur") {?>
              <div class="col">
                <p class="mb-0 order-status order-status-red">
                  <?= $ord["status"] ?> : <span class="order-status-refund"><?= $ord["status_refund"] ?></span>
                </p>
              </div>
          <?php } else { ?>
            <div class="col">
              <p class="mb-0 order-status order-status-red"><?= $ord["status"] ?></p>
            </div>
          <?php } ?>
        </div>
      </div>
      <div class="container pt-4 pb-4">
        <div class="row">
          <div class="col-2" style="margin-left:40px">
            <img src="../<?= $det["img"] ?>" alt="belanja" height="120" width="120">
          </div>
          <div class="col-7">
            <h5><?= $det["nama_barang"] ?></h5>
            <p style="font-size : 14px; color: green">Total <?= $produk ?> Produk</p>
          </div>
          <div class="col text-center" style="border-left : 1px solid #000">
            <p>Total Belanja</p>
            <h5><?= rupiah($total) ?></h5>
            <!-- Button trigger modal -->
            <?php 
            if ($ord["status"] == "Belum Bayar") {
            ?>
              
              <a class="btn btn-success" href="pembayaran.php?id=<?= $ord["id_orders"] ?>">
                Bayar
              </a>
            <?php }?>
            <?php 
            if ($ord["status"] == "Dikirim") {
            ?>
              <a class="btn btn-warning" href="refund.php?id=<?= $ord["id_orders"] ?>">
                Retur
              </a>
            <?php }?>
            <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal<?= $ord["id_orders"] ?>">
              Detail
            </button>
            <?php 
            if ($ord["status"] == "Belum Bayar") {
            ?>
              <a class="btn btn-danger mt-2" href="batal.php?id=<?= $ord["id_orders"] ?>"onclick="return confirm('Yakin Untuk Membatalkan Pesanan?')">
                Batalkan pesanan
              </a>
            <?php }?>
            <?php
            if ($ord["status"] == "Dikirim") {
            ?>
              <a class="btn btn-success mt-1" href="rating.php?id=<?= $ord["id_orders"] ?>">
                Pesanan Selesai
              </a>
            <?php }?>
            <?php
            if ($ord["status"] == "Retur") {
            ?>
              <a class="btn btn-success mt-1" href="rating.php?id=<?= $ord["id_orders"] ?>">
                Nilai Pesanan
              </a>
            <?php }?>
            
            <!-- Modal -->
            <div class="modal fade" id="exampleModal<?= $ord["id_orders"] ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Detail Pesanan</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="container pb-4">
                      <div class="row pb-2" style="border-bottom : 1px dashed #000">
                        <div class="col-2">
                        </div>
                        <div class="col-5">
                          Nama Barang
                        </div>
                        <div class="col">
                          Jumlah
                        </div>
                        <div class="col">
                          Harga
                        </div>
                      </div>
                      <?php 
                      foreach ($harga as $hr){
                      ?>
                      <div class="row pt-4">
                        <div class="col-2">
                          <a href="deskripsi.php?id=<?= $hr["id_barang"] ?>">
                            <img src="../<?= $hr["img"] ?>" alt="details" height="50" width="50">
                          </a>
                        </div>
                        <div class="col-5">
                          <?= $hr["nama_barang"] ?>
                        </div>
                        <div class="col">
                          <?= $hr["qty"] ?>
                        </div>
                        <div class="col">
                          <?= rupiah($hr["harga_satuan"]) ?>
                        </div>
                      </div>
                      <?php }?>
                    </div>
                    <div class="container pt-3" style="border-top : 1px dashed #000">
                      <div class="row">
                        <div class="col-2">
                        </div>
                        <div class="col-5">
                          
                        </div>
                        <div class="col">
                          Total Pesanan
                        </div>
                        <div class="col">
                          <div class="dropdown">
                            <p class="dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                              <?= rupiah($total) ?>
                            </p>
                            
                            <ul class="dropdown-menu">
                              <li>
                                <div class="container p-0">
                                  <div class="container">
                                    Subtotal Produk
                                  </div>
                                  <div class="container">
                                    <?= rupiah($total_harga) ?>
                                  </div>
                                </div>
                              </li>
                              <li>
                                <div class="container pt-2 p-0">
                                  <div class="container">
                                    Total Jasa Kirim
                                  </div>
                                  <div class="container">
                                     <?= rupiah($hr["harga_jasa"]) ?>
                                  </div>
                                </div>
                              </li>
                              <li>
                                <div class="container pt-2 pb-2 p-0">
                                  <div class="container">
                                    Biaya Layanan
                                  </div>
                                  <div class="container">
                                    <?= rupiah($hr["harga_admin"]) ?>
                                  </div>
                                </div>
                              </li>
                              <li>
                                <div class="container pt-2 p-0" style="border-top : 1px dashed #000">
                                  <div class="container">
                                    Total Pembayaran
                                  </div>
                                  <div class="container">
                                    <?= rupiah($total) ?>
                                  </div>
                                </div>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <div class="row pb-3">
                        <div class="col-2">
                        </div>
                        <div class="col-5">
                          
                        </div>
                        <div class="col">
                          Jasa Kirim
                        </div>
                        <div class="col">
                          <?= $hr["nama_jasa"] ?>
                        </div>
                      </div>
                      
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php 
    }?>
  </div>
  <footer class="py-4 mt-5 pt-5" style="background-color:#6fc3ff ; box-shadow: -5px -4px 15px rgba(0, 0, 0, 0.2)">
    <div class="container px-4">
        <div class="row">
            <div class="col-lg-6 my-3">
                <h5>Tentang Toko Teknomart</h5>
                <p style="font-size:16px">Teknomart adalah toko elektronik dengan koleksi lengkap alat elektronik untuk dapur, rumah tangga, sekolah, dan gaming. Kami menyediakan metode pembayaran melalui bank BRI, BNI, BTN, Mandiri, dan DANA, dengan biaya pengiriman hanya Rp 20.000,- melalui JNE, J&T, dan Sicepat. Fleksibel dalam pemesanan, termasuk opsi pembatalan dan Retur sesuai syarat. Kepuasan pelanggan adalah prioritas utama kami.</p>
            </div>
            <div class="col-lg-3 my-3">
                <h5>Contact Person</h5>
                <p>Nama: Tekno Mart</p>
                <p>Email: admintekno@teknomart.com</p>
                <p>Telepon: <a href="https://wa.me/6285806203920" style="text-decoration:none;color:black">085806203920</a></p>
            </div>
            <div class="col-lg-3 my-3">
                <h5>Alamat</h5>
                <p>Universitas Trunojoyo Madura</p>
                <p>Jawa Timur</p>
                <p>Indonesia</p>
            </div>
        </div>
    </div>
  </footer>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>