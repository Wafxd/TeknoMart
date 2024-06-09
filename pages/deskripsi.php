<?php 
session_start();
include "../db/koneksi.php";

$id = $_GET["id"];
$produk = query("SELECT * FROM tb_barang WHERE id_barang = $id")[0];

$ctg = $produk["kategori"];

$rating = query("SELECT details.rating, details.ulasan, tb_user.nama, details.foto FROM details
                inner join tb_barang using(id_barang)
                inner join orders using(id_orders)
                inner join tb_user using(id_user)
                WHERE id_barang = $id");


$kategori = query("SELECT * FROM tb_barang WHERE kategori = '$ctg' and id_barang != $id ORDER BY RAND() LIMIT 3");

if (isset($_SESSION['username'])) {
  $username = $_SESSION["username"];
} else {
  $username = null;
}



if (isset($_POST["submit"])) {
  if (!isset($username)) {
      echo "
          <script>
              alert('Silahkan Login Terlebih Dahulu');
              document.location.href = '../index.php';
          </script>
      ";
  } else {
      $id_barang = $_POST["id_barang"];
      $user = $_SESSION["id_user"];
      $qty = $_POST["qty"];

      $barang_di_keranjang = cek_keranjang($id_barang, $user);

      if ($barang_di_keranjang > 0) {
          // Barang sudah ada di keranjang, update stok
          $query_update = "UPDATE keranjang SET qty = qty + '$qty' WHERE id_barang = '$id_barang' AND id_user = '$user'";
          mysqli_query($conn, $query_update);
          echo "
              <script>
                  alert('Barang berhasil ditambahkan ke keranjang, barang ini sudah ada di keranjang anda!');
                  document.location.href = 'deskripsi.php?id={$produk['id_barang']}';
              </script>
          ";
      } else {
          // Barang belum ada di keranjang, tambahkan ke keranjang
          if (add_keranjang($_POST) > 0) {
              echo "
                  <script>
                      alert('Barang berhasil ditambahkan ke keranjang!');
                      document.location.href = 'deskripsi.php?id={$produk['id_barang']}';
                  </script>
              ";
          } else {
              echo "
                  <script>
                      alert('Barang gagal ditambahkan ke keranjang!');
                      document.location.href = 'deskripsi.php?id={$produk['id_barang']}';
                  </script>
              ";
          }
      }
  }
}
if (isset($_POST["buy_now"])) {
  if (!isset($_SESSION['username'])) {
      echo "
          <script>
              alert('Silahkan Login Terlebih Dahulu');
              document.location.href = '../index.php';
          </script>
      ";
  } else {
      $id_barang = $_POST["id_barang"];
      $qty = $_POST["qty"];
      $_SESSION['id_barang'] = $id_barang;
      $_SESSION['qty'] = $qty; // Simpan jumlah barang dalam session qty
      echo "
          <script>
              document.location.href = 'rinciannow.php';
          </script>
      ";
  }
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Description</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/navbar.css">
  <link rel="stylesheet" href="../css/desc.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
  <div class="container p-3 pb-0" >
    <div class="row m-4 p-3 pb-0" style="background-color: #d4edff; height:500px; border-radius: 10px ; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
      <div class="col-5 text-center pt-4" style="margin-right: 0px; padding-right: 0px">
        <div class="image-overlay <?php echo $produk["stok"] == 0 ? 'out-of-stock' : ''; ?>">
          <img src="../<?= $produk["img"] ?>" alt="" height="380" class="zoom-img" id="myImg" style="margin-right: 0px; padding-right: 0px;">
          <?php if ($produk["stok"] == 0) { ?>
            <div class="overlay">Habis</div>
          <?php } ?>
        </div>
      </div>
      <div id="myModal" class="modal">
        <span class="close">&times;</span>
        <img class="modal-content" id="img01">
      </div>
      <script src="../js/desc.js"></script>
      <div class="col pt-4 pb-0">
        <form method="post">
          <input type="hidden" name="id_barang" value="<?= $id ?>">
          
          <h5 class="text"><?= $produk["nama_barang"] ?></h5>
          <p class="jual">Terjual : <?= $produk["terjual"] ?></p>
          <h5 class="harga" style="color: rgb(222, 72, 72)">Rp<?= number_format($produk["harga"], 0, ',', '.') ?></h5>
          <div class="container" style="padding-top:100px;padding-left:0px">
            <table >
              <tr>
                <td style="font-size:24px">Kuantitas</td>
                <td width="50"></td>
                <td><input type="number" class="form-control" name="qty" min="1" value="1" max="<?= $produk["stok"] ?>" style="width:100px"></td>
              </tr>
            </table>
          </div>
          <p class="stok">Stok : <?= $produk["stok"] ?></p>
          <table style="margin-top: 45px;">
            <tr>
              <?php 
              if ($produk["stok"] != 0){
              ?>
              <td>
                <button name="submit" class="keranjang">
                  Masukkan Keranjang
                </button>
              </td>
              <td style="padding: 20px;"></td>
              <td>
                <button class="now" name="buy_now">
                  Beli Sekarang
                </button>
              </td>
              <?php }else{?>
                <td>
                <button class="btn btn-danger btn-lg btn-disabled" disabled>
                  Habis
                </button>
              </td>
              <?php }?>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>

  <div class="container" >
    <div class="row m-3 p-3 pt-0">
      <div class="col-sm-9" style="background-color: #d4edff; width : 74%; margin-right:12px ; border-radius : 10px ; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
          <div class="container pt-5 ps-5">
            <h5>Spesifikasi Product</h5>
          </div>
          <div class="container pt-4 ps-5">
            <div class="row">
              <div class="col-2">
                <p style="font-size:16px ;color: #6E6F71">Kategori</p>
                <p style="font-size:16px ; color: #6E6F71">Merk</p>
              </div>
              <div class="col">
                <p style="font-size:16px ;"><?= $produk["kategori"] ?></p>
                <p style="font-size:16px ;"><?= $produk["merk"] ?></p>
              </div>
            </div>
          </div>
          <div class="container pt-4 ps-5">
            <h5>Deskripsi Product</h5>
          </div>
          <div class="container pt-4 ps-5 pb-5">
            <p style="font-size:16px ;"><?= nl2br($produk["keterangan"]) ?></p>
          </div>
      </div>
    
      <div class="col-sm-3 p-5 pt-4" style="background-color: #d4edff; border-radius : 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); ">
        <div class="row text-center p-3">
          <h5>Lainnya di <?= $produk["kategori"] ?></h5>
        </div>
        <?php 
        foreach($kategori as $kt){
          
        ?>
          <div class="row text-center p-3">
            <div class="container-custom" onclick="window.location.href='deskripsi.php?id=<?= $kt['id_barang'] ?>'">
              <img src="../<?= $kt["img"] ?>" alt="img">
              <p class="pt-3"><?= substr($kt["nama_barang"], 0, 32) . "..." ?></p>
              <p><?= rupiah($kt["harga"]) ?></p>
            </div>
          </div>
        <?php }?>
      </div>

    </div>
  </div>
  <div class="container" >
    <div class="row m-3 p-3 pt-0">
      <div class="col-sm-9" style="background-color: #d4edff; width : 74%; margin-right:12px ; border-radius : 10px ; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);">
          <div class="container p-4 ps-5 pt-5 pb-2">
            <h5>Penilaian Product</h5>
          </div>
          <div class="container p-4">
            <?php 
            foreach($rating as $rt){
              $rtg = $rt["rating"];
              if ($rt["rating"] > 0) {
            ?>
                <div class="container ps-4 p-5 pt-3 mb-4" style="background-color : #cbe4fb; border-radius:8px ; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1)">
                  <p class="mb-0" style="font-size:18px"><?= $rt["nama"] ?></p>
                  <p class="card-text mt-0" style="font-size:16px ;">
                        <?php for ($i = 1; $i <= 5; $i++): ?>
                            <i class="fa<?= $i <= $rtg ? 's' : 'r' ?> fa-star" style="color: #ff9f2e;"></i>
                        <?php endfor; ?>
                  </p>
                  <?php 
                  if (!empty($rt["ulasan"])) {
                  ?>
                  <div class="container pt-2 pb-5" style="background-color:#fbfbfb; border-radius:8px ; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1)">
                    <p class="mb-0" style="font-size:15px"><?= $rt["ulasan"]?></p>
                  </div>
                  <?php }?>
                  <?php 
                  if (!empty($rt["foto"])){
                  ?>
                  <img class="square-img mt-3 ms-2" src="../<?= $rt["foto"] ?>" alt="" onclick="openPopup('../<?= $rt['foto'] ?>')">
                  <?php }?>
                </div>
                <?php }?>
            <?php }?>
          </div>
          <div id="popup-overlay" class="popup-overlay" onclick="closePopup()">
              <img id="popup-image" class="popup-image" src="" alt="Full Image">
          </div>

      </div>
    </div>
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
  
  <script>
    function openPopup(imageSrc) {
      const overlay = document.getElementById('popup-overlay');
      const popupImage = document.getElementById('popup-image');
      popupImage.src = imageSrc;
      overlay.classList.add('show');
      popupImage.classList.add('show'); // Add this to trigger the animation
      overlay.style.display = 'flex'; // Ensure the overlay is displayed
    }

    function closePopup() {
        const overlay = document.getElementById('popup-overlay');
        const popupImage = document.getElementById('popup-image');
        popupImage.classList.remove('show'); // Remove this to stop the animation
        overlay.classList.remove('show');
        setTimeout(() => {
            overlay.style.display = 'none'; // Hide the overlay after the transition
        }, 300); // Match the duration of the CSS transition
    }
  </script>
  

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>