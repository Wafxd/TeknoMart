<?php 
session_start();
include "../db/koneksi.php";

$login = isset($_SESSION["id_user"]) ? $_SESSION["id_user"] : null;

if ($login == null) {
    $nama = null;
} else {
    $nama = query("SELECT * FROM tb_user WHERE id_user = '$login'")[0];
}

if ($login) {
    $barang = query("SELECT * FROM keranjang INNER JOIN tb_barang ON tb_barang.id_barang = keranjang.id_barang WHERE id_user = $login");

    if (isset($_POST["submit"])) {
        foreach ($_POST['qty'] as $id_barang => $qty) {
            $query = "UPDATE keranjang SET qty = $qty WHERE id_barang = $id_barang AND id_user = $login";
            mysqli_query($conn, $query);
        }
        if (isset($_SESSION['selected_cart_items']) && is_array($_SESSION['selected_cart_items'])) {
            foreach ($_POST['id_barang'] as $id_barang) {
                if (($key = array_search($id_barang, $_SESSION['selected_cart_items'])) !== false) {
                    unset($_SESSION['selected_cart_items'][$key]);
                }
            } 
            $selected_products = isset($_POST['id_barang']) ? $_POST['id_barang'] : array();
            $_SESSION['selected_cart_items'] = array_merge($_SESSION['selected_cart_items'], $selected_products);
        } else {
            $_SESSION['selected_cart_items'] = isset($_POST['id_barang']) ? $_POST['id_barang'] : array();
        }
        echo "<script>
            document.location.href = 'rincian.php';
        </script>";
    }    

    if (isset($_POST['hps'])) {
        $id_barang = $_POST['brg'];
        if (hapusBarang($login, $id_barang)) {
            echo "<script>
                alert('Barang berhasil dihapus dari keranjang');
                document.location.href = 'keranjang.php';
            </script>";
        } else {
            echo "<script>
                alert('Gagal menghapus barang');
            </script>";
        }
    }
    
} else {
    echo "<script>
            alert('Silakan login terlebih dahulu');
            document.location.href = '../index.php';
        </script>";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Keranjang Belanja</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="../css/keranjang.css">
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
                <button class="dropbtn" id="dropdownBtn" style="margin-right : 30px"><img src="../assets/icon/profile.png" alt="" height=25 width=25><span style="margin-left:10px"><?= $nama["username"] ?></span></button>
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
    <div class="container mt-5">
        <h1 class="text-center mb-4">Keranjang Belanja</h1>
        <form method="post" id="cart-form">
            <div class="product-list" style="padding-bottom:140px">
                <?php foreach ($barang as $brg): ?>
                    <div class="product-card <?= $brg['stok'] == 0 ? 'out-of-stock' : '' ?>" id="product-<?= $brg['id_barang']; ?>">
                        <div class="product-info">
                            <?php if ($brg['stok'] == 0): ?>
                                <div class="overlay">Stok Habis</div>
                            <?php endif; ?>
                            <input type="checkbox" class="form-check-input product-checkbox" style="margin-right:60px ; margin-left:40px ; box-shadow: 1px 2px 5px rgba(0, 0, 0, 0.3); " name="id_barang[]" value="<?= $brg['id_barang']; ?>" data-harga="<?= $brg['harga']; ?>">
                            <a href="deskripsi.php?id=<?= $brg["id_barang"] ?>">
                                <img src="../<?= $brg["img"] ?>" style="margin-right:60px" alt="Product Image">
                            </a>
                            <div class="product-details col-auto">
                                <h5><?= substr($brg["nama_barang"], 0, 35) . "..." ?></h5>
                                <p>Rp<?= number_format($brg["harga"], 0, ',', '.') ?></p>
                            </div>
                        </div>
                        <div class="product-actions">
                            <?php if ($brg['stok'] != 0): ?>
                                <input type="number" class="form-control quantity" name="qty[<?= $brg['id_barang']; ?>]" data-id="<?= $brg['id_barang']; ?>" min="1" max="<?= $brg["stok"] ?>" value="<?= $brg["qty"] ?>">
                                <button class="btn btn-danger delete-button" type="button" data-id="<?= $brg['id_barang']; ?>">Hapus</button>
                            <?php endif; ?>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
            <div class="checkout-section d-flex justify-content-between align-items-center fixed-bottom">
                <div>
                    <h3>Total Harga: <span id="total-harga">0</span></h3>
                    <h3>Total Produk Dipilih: <span id="total-produk">0</span></h3>
                </div>
                <button name="submit" type="submit" class="btn-checkout btn-lg">Checkout</button>
            </div>
            <input type="hidden" id="delete-id" name="brg" value="">
            <button type="submit" name="hps" id="delete-submit" style="display:none;"></button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function updateTotal() {
            var totalHarga = 0;
            var totalProduk = $('.product-checkbox:checked').length;

            $('.product-checkbox:checked').each(function() {
                var id = $(this).val();
                var harga = $(this).data('harga');
                var qty = $('input.quantity[data-id="' + id + '"]').val();
                var hargaTotal = harga * qty;
                totalHarga += hargaTotal;
            });

            $('#total-harga').text('Rp' + totalHarga.toLocaleString('id-ID'));
            $('#total-produk').text(totalProduk);
        }

        $(document).ready(function() {
            $('.product-checkbox, .quantity').change(updateTotal); // Update total on change in quantity or selection
            updateTotal(); // Initial total update

            $('.delete-button').click(function() {
                var id = $(this).data('id');
                $('#delete-id').val(id);
                $('#delete-submit').click();
            });
        });
    </script>
</body>
</html>
