<?php
session_start();
include "db/koneksi.php";

if (isset($_SESSION['id_user']) && isset($_SESSION['username'])) {
    $id_user = $_SESSION['id_user'];
    $username = $_SESSION["username"];
    $nama = query("SELECT * FROM tb_user WHERE id_user = '$id_user'")[0];
} else {
    $id_user = null;
    $username = null;
    $nama = null;
}

$barang = query("SELECT *,
                (SELECT AVG(rating) FROM details WHERE details.id_barang = tb_barang.id_barang AND rating != 0) AS average_rating
                FROM tb_barang
                ORDER BY average_rating DESC, terjual DESC 
                LIMIT 18");

?>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Techno Mart</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="css/stylehome.css">
  <link rel="stylesheet" href="css/navbar.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <script src="js/dropdown.js"></script>
  <a href="https://wa.me/6285806203920" class="whatsapp-float" target="_blank">
      <img src="assets/icon/wa.png" alt="WhatsApp" class="whatsapp-icon">
  </a>
  <div class="floating-menu-container">
    <div class="floating-menu">
        <div class="floating-header">
            <h4>Menu Cepat</h4>
        </div>
        <a href="pages/pesanan.php" class="floating-item">Pesananmu</a>
        <?php 
        if (!isset($_SESSION['id_user'])) {
        ?>
        <a href="#" class="floating-item">Profile mu</a>
        <?php } else{?>
        <a href="pages/profile.php?id=<?= $id_user ?>" class="floating-item">Profile mu</a>
        <?php }?>
    </div>
  </div>
  <nav class="navbar navbar-expand-lg" style="background-color: #6fc3ff;">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" style="padding-left: 50px">
        <img src="assets/icon/logo.png" alt="Techno" width="70" height="70" class="d-inline-block">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <form class="d-flex ms-auto" role="search" action="pages/search_product.php" method="GET">
          <input class="form-control me-2" type="search" name="search_query" placeholder="Search" aria-label="Search">
      </form>
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="navbar-brand" href="pages/keranjang.php">
              <img src="assets/icon/cart.png" alt="Logo" width="30" height="25" class="d-inline-block align-text-top">
            </a>
          </li>
        </ul>
        <?php 
        if (!isset($_SESSION["id_user"])) {
        ?>
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0" style="padding-right:20px">
          <li class="nav-item-login">
            <a class="nav-link" aria-current="page" href="pages/login.php">LOGIN</a>
          </li>
        </ul>
        <?php 
        } else {
        ?>
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item" id="dropdownContainer">
              <div class="dropdown" id="dropdown">
                <button class="dropbtn" id="dropdownBtn" style="margin-right : 30px"><img src="assets/icon/profile.png" alt="" height=25 width=25><span style="margin-left:10px"><?= $nama["username"] ?></span></button>
                <div class="dropdown-content" id="dropdownContent">
                  <a href="pages/pesanan.php">Pesanan</a>
                  <a href="pages/profile.php">Profile</a>
                  <a href="pages/logout.php" onclick="return confirm('Apakah anda yakin ingin Logout?')">Logout</a>
                </div>
              </div>
            </li>
          </ul>
        <?php }?>
      </div>
    </div>
  </nav>


<!-- Slider --> <!-- Slider --> <!-- Slider --> <!-- Slider -->
<!-- Slider --> <!-- Slider --> <!-- Slider --> <!-- Slider -->
<!-- Slider --> <!-- Slider --> <!-- Slider --> <!-- Slider -->




  <div class="container-carousel">
    <div id="carouselExample" class="carousel slide mt-5 mx-auto">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <a href="pages/product.php?kategori=<?= "laptop" ?>">
            <img src="assets/img/ban1.jpg" class="d-block w-100" alt="...">
          </a>
        </div>
        <div class="carousel-item">
          <a href="pages/product.php?kategori=<?= "kulkas" ?>">
            <img src="assets/img/ban2.jpg" class="d-block w-100" alt="...">
          </a>
        </div>
        <div class="carousel-item">
          <a href="pages/product.php?kategori=<?= "mesin cuci" ?>">
            <img src="assets/img/ban3.jpg" class="d-block w-100" alt="...">
          </a>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>

<!-- KATEGORI --> <!-- KATEGORI --> <!-- KATEGORI --> <!-- KATEGORI -->
<!-- KATEGORI --> <!-- KATEGORI --> <!-- KATEGORI --> <!-- KATEGORI -->
<!-- KATEGORI --> <!-- KATEGORI --> <!-- KATEGORI --> <!-- KATEGORI -->


  <div class="container mt-5">
    <div class="judul-kategori" style="background-color : #fff; padding: 5px 10px; margin: 5px 150px ; box-shadow: 5px 4px 15px rgba(0, 0, 0, 0.2); border-radius : 5px">
      <h5 class="text-center" style="margin-top: 5px;">KATEGORI</h5>
    </div>
    <div class="row text-center row-container pb-3" style="box-shadow: 5px 4px 15px rgba(0, 0, 0, 0.2); border-radius : 5px">
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "kipas" ?>"><img src="assets/icon/fan.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Kipas Angin</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "mesin cuci" ?>"><img src="assets/icon/mesincuci.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Mesin Cuci</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "headphone" ?>"><img src="assets/icon/headphone.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Headphone</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "tv" ?>"><img src="assets/icon/tv.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Television</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "handphone" ?>">
            <img src="assets/icon/hp.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Handphone</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "speaker" ?>"><img src="assets/icon/speaker.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Audio Speaker</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "microphone" ?>"><img src="assets/icon/mic.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Microphone</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "microwave" ?>"><img src="assets/icon/microwave.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Microwave</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "monitor" ?>"><img src="assets/icon/monitor.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Monitor</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "rice cooker" ?>"><img src="assets/icon/ricecooker.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Rice Cooker</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "vacum cleaner" ?>"><img src="assets/icon/vacum.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Vacum Cleaner</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "projector" ?>"><img src="assets/icon/proyektor.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Proyektor</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "setrika" ?>"><img src="assets/icon/setrika.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Setrika</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "dispenser" ?>"><img src="assets/icon/dispenser.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Dispenser</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "ac" ?>"><img src="assets/icon/ac.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">AC</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "kulkas" ?>"><img src="assets/icon/kulkas.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Kulkas</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "lampu" ?>"><img src="assets/icon/lampu.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Lampu</p>
          </a>
        </div>
      </div>
      <div class="col-lg-2 col-md-3 col-sm-4 col-6">
        <div class="menu-kategori">
          <a href="pages/product.php?kategori=<?= "laptop" ?>"><img src="assets/icon/laptop.png" alt="ctg" class="img-categori mt-4">
            <p class="mt-2">Laptop</p>
          </a>
        </div>
      </div>
    </div>
  </div>


<!-- HOT PRODUK --> <!-- HOT PRODUK --> <!-- HOT PRODUK -->
<!-- HOT PRODUK --> <!-- HOT PRODUK --> <!-- HOT PRODUK -->
<!-- HOT PRODUK --> <!-- HOT PRODUK --> <!-- HOT PRODUK -->


  <div class="container pb-5" >
    <div class="judul-kategori" style="background-color: #fff; padding: 5px 10px; margin: 20px 150px ; box-shadow: 5px 4px 15px rgba(0, 0, 0, 0.2); border-radius : 5px">
      <h5 class="text-center mt-3" >PRODUK UNGGULAN</h5>
      <div class="row pb-3" >
        <?php 
        foreach ($barang as $brg){
          $average_rating = round($brg['average_rating'] ?? 0, 1); // Pembulatan rating ke satu desimal
    
          if ($average_rating === null) {
              $average_rating = 0; // Atau nilai default lainnya
          }
        ?>
        <div class="col-lg-2 col-md-2 col-sm-4 col-6 mt-3">
          <div class="card text-center">
            <a href="pages/deskripsi.php?id=<?=$brg["id_barang"]?>">
              <img src="<?= $brg["img"] ?>" alt="prdk" class="card-img-top">
            </a>
            <div class="card-body">
              <h6 class="card-title"><?= substr($brg["nama_barang"], 0, 15) . "..." ?></h6>
              <p class="card-text m-0" style="font-size:12px">Terjual : <?= $brg["terjual"]?></p>
              <p class="card-text" style="font-size:12px">
                    <?php for ($i = 1; $i <= 5; $i++): ?>
                        <i class="fa<?= $i <= $average_rating ? 's' : 'r' ?> fa-star" style="color: #ffc42e;"></i>
                    <?php endfor; ?>
                </p>
              <p class="card-text" style="color: #2BAAFF">Rp<?= number_format($brg["harga"], 0, ',', '.') ?></p>
              <a href="pages/deskripsi.php?id=<?=$brg["id_barang"]?>" class="btn btn-primary d-grid">Beli</a>
            </div>
          </div>
        </div>
        <?php }?>
      </div>
    </div>
  </div>
  <footer class="py-4 mt-auto" style="background-color:#6fc3ff ; box-shadow: -5px -4px 15px rgba(0, 0, 0, 0.2)">
    <div class="container px-4">
        <div class="row">
            <div class="col-lg-6 my-3">
                <h5>Tentang Toko Teknomart</h5>
                <p style="font-size:16px">
                  Teknomart adalah toko elektronik dengan koleksi lengkap alat elektronik untuk dapur, 
                  rumah tangga, sekolah, dan gaming. Kami menyediakan metode pembayaran melalui bank BRI, 
                  BNI, BTN, Mandiri, dan DANA, dengan biaya pengiriman hanya Rp 20.000,- melalui JNE, J&T, dan Sicepat. 
                  Fleksibel dalam pemesanan, termasuk opsi pembatalan dan refund sesuai syarat. 
                  Kepuasan pelanggan adalah prioritas utama kami.
                </p>
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
  <script>
    document.addEventListener("DOMContentLoaded", function() {
        const footer = document.querySelector('footer');
        const floatingMenu = document.querySelector('.floating-menu');
        const whatsappButton = document.querySelector('.whatsapp-float');
        
        // Mendapatkan tinggi dari floating menu
        const floatingMenuHeight = floatingMenu.offsetHeight;
        // Mendapatkan posisi vertikal footer
        const footerPosition = footer.offsetTop;
        
        window.addEventListener('scroll', function() {
            // Mendapatkan posisi vertikal saat scroll
            const scrollPosition = window.scrollY;
            // Mendapatkan tinggi jendela browser
            const windowHeight = window.innerHeight;
            // Mendapatkan posisi vertikal floating menu
            const floatingMenuPosition = scrollPosition + windowHeight - floatingMenuHeight;
            
            // Jika posisi vertikal floating menu mendekati atau melebihi footer
            if (scrollPosition >= footerPosition - windowHeight + floatingMenuHeight - 100) {
                // Menghentikan floating menu di atas footer
                floatingMenu.style.bottom = `${windowHeight - (footerPosition - scrollPosition)}px`;
                whatsappButton.style.bottom = `${windowHeight - (footerPosition - scrollPosition) + floatingMenuHeight + 10}px`; // Atur posisi WhatsApp button di atas floating menu
            } else if (scrollPosition >= footerPosition - windowHeight * 0.5) { // Jika sudah mendekati setengah bagian bawah halaman
                // Angkat floating menu dan tombol WhatsApp lebih tinggi
                floatingMenu.style.bottom = `${windowHeight * 0.2 - floatingMenuHeight * 0.2}px`;
                whatsappButton.style.bottom = `${windowHeight * 0.2 - floatingMenuHeight * 0.2 + floatingMenuHeight + 10}px`;
            } else {
                // Mengembalikan floating menu ke posisi awal
                floatingMenu.style.bottom = '30px';
                whatsappButton.style.bottom = '210px'; // Atur posisi WhatsApp button ke posisi awal
            }
        });
    });



  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script src="js/carousel.js"></script>
  
</body>
</html>
