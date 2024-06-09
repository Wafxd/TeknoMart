<?php 
include "../db/koneksi.php";
$kategori = $_GET["kategori"];
$sells = isset($_GET["topsells"]) ? $_GET["topsells"] : 'desc';
if (!in_array($sells, ['asc', 'desc'])) {
    $sells = 'desc';
}
$limit = 20; 
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$offset = ($page - 1) * $limit;
$total_products = query("SELECT COUNT(*) as count FROM tb_barang WHERE kategori = '$kategori'")[0]['count'];
$total_pages = ceil($total_products / $limit);
$produk = query("SELECT * FROM tb_barang WHERE kategori = '$kategori' ORDER BY terjual $sells LIMIT $limit OFFSET $offset");
$prdk = query("SELECT DISTINCT merk, kategori FROM tb_barang WHERE kategori = '$kategori'");
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/product.css">
  <link rel="stylesheet" href="../css/navbar.css">
</head>
<body>
  <a href="https://wa.me/6285806203920" class="whatsapp-float" target="_blank">
      <img src="../assets/icon/wa.png" alt="WhatsApp" class="whatsapp-icon">
  </a>
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
  <div class="container p-5 pt-4 mt-5" style="background-color : #fff ; box-shadow: 5px 4px 15px rgba(0, 0, 0, 0.1); border-radius : 10px ">
  <a href="../index.php">Beranda</a>
    <div class="container p-4" style="">
      <div class="container p-2 ms-4">
        <div class="row">
          <div class="col-2">
            <div class="dropdown">
              <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Filter by brand
              </a>

              <ul class="dropdown-menu">
                <?php 
                foreach ($prdk as $pr) {
                  $pk = $pr["kategori"];
                ?>
                <li><a class="dropdown-item" href="filterbrand.php?kategori=<?= $pk?>&merk=<?= $pr["merk"] ?>"><?= $pr["merk"] ?></a></li>
                <?php }?>
              </ul>
            </div>
          </div>
          <div class="col-1" style="margin-right:80px">          
            <div class="dropdown">
              <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Sort By Price
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="filterprice.php?kategori=<?= $pk?>&harga=asc">Terendah ke Tertinggi</a></li>          
                <li><a class="dropdown-item" href="filterprice.php?kategori=<?= $pk?>&harga=desc">Tertinggi ke Terendah</a></li>          
              </ul>
            </div>            
          </div>
          <div class="col">          
            <div class="dropdown">
              <a class="btn btn-primary" href="filterrecomendation.php?kategori=<?= $pk?>&topsells=desc">
                Sort By Recomendation
              </a>
            </div>          
          </div>
        </div>
      </div>

      <div class="content">
          <?php foreach ($produk as $prd) { ?>
              <div class="item" onclick="window.location.href='deskripsi.php?id=<?= $prd['id_barang'] ?>'">
                  <img src="../<?= $prd["img"]; ?>" alt="" />
                  <div>
                      <p><?= substr($prd["nama_barang"], 0, 32) . "..."; ?></p>
                      <h2><?= rupiah($prd["harga"]); ?></h2>
                  </div>
              </div>
          <?php } ?>
      </div>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item <?= ($page <= 1) ? 'disabled' : '' ?>">
                <a class="page-link" href="?kategori=<?= $kategori ?>&topsells=<?= $sells ?>&page=<?= $page - 1 ?>" tabindex="-1">Previous</a>
            </li>
            <?php for ($i = 1; $i <= $total_pages; $i++) { ?>
                <li class="page-item <?= ($page == $i) ? 'active' : '' ?>"><a class="page-link" href="?kategori=<?= $kategori ?>&topsells=<?= $sells ?>&page=<?= $i ?>"><?= $i ?></a></li>
            <?php } ?>
            <li class="page-item <?= ($page >= $total_pages) ? 'disabled' : '' ?>">
                <a class="page-link" href="?kategori=<?= $kategori ?>&topsells=<?= $sells ?>&page=<?= $page + 1 ?>">Next</a>
            </li>
        </ul>
    </nav>
  </div>
  <footer class="py-4 mt-5 " style="background-color:#6fc3ff ; box-shadow: -5px -4px 15px rgba(0, 0, 0, 0.2)">
    <div class="container px-4">
        <div class="row">
            <div class="col-lg-6 my-3">
                <h5>Tentang Toko Teknomart</h5>
                <p style="font-size:16px">Teknomart adalah toko elektronik dengan koleksi lengkap alat elektronik untuk dapur, rumah tangga, sekolah, dan gaming. Kami menyediakan metode pembayaran melalui bank BRI, BNI, BTN, Mandiri, dan DANA, dengan biaya pengiriman hanya Rp 20.000,- melalui JNE, J&T, dan Sicepat. Fleksibel dalam pemesanan, termasuk opsi pembatalan dan refund sesuai syarat. Kepuasan pelanggan adalah prioritas utama kami.</p>
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
