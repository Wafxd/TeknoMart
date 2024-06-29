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

$id = $_GET["id"];
$orders = query("SELECT * FROM orders
                INNER JOIN details USING(id_orders)
                INNER JOIN tb_barang USING(id_barang)
                WHERE id_orders = '$id'");

$ordid = query("SELECT id_orders FROM orders WHERE id_orders = '$id'")[0];

if (isset($_POST["submit"])) {
    if (!isset($_SESSION["id_user"])) {
        echo "
            <script>
                alert('Silahkan Login Terlebih Dahulu');
                document.location.href = '../home.php';
            </script>
        ";
    } else {
        $success = true;

        foreach ($_POST['id_barangs'] as $id_barang) {
            $rating = isset($_POST['ratings'][$id_barang]) ? $_POST['ratings'][$id_barang] : 0;
            $ulasan = isset($_POST['ulasan'][$id_barang]) ? $_POST['ulasan'][$id_barang] : '';
            $foto = '';
            $id_orders = $_POST['order_id'];

            if (isset($_FILES['foto']['name'][$id_barang]) && !empty($_FILES['foto']['name'][$id_barang])) {
                $file_name = uniqid() . '_' . $_FILES['foto']['name'][$id_barang];
                $tmp_name = $_FILES['foto']['tmp_name'][$id_barang];

                $target_dir = "../upload/";
                $target_file = $target_dir . basename($file_name);
                $foto = "upload/" . basename($file_name);

                if (!move_uploaded_file($tmp_name, $target_file)) {
                    $success = false;
                }
            }

            if (!add_rating($id_orders, $id_barang, $rating, $ulasan, $foto)) {
                $success = false;
            }
        }

        if ($success) {
            selesai($_POST["id_orders"]);
            echo "
                <script>
                    alert('Rating berhasil ditambahkan!');
                    document.location.href = 'pesanan.php';
                </script>
            ";
        } else {
            echo "
                <script>
                    alert('Rating gagal ditambahkan!');
                    document.location.href = 'pesanan.php';
                </script>
            ";
        }
    }
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Rating</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/navbar.css">
  <style>
    .star {
        cursor: pointer; /* Set kursor menjadi pointer */
        font-size: 32px;
        color: grey;
    }
    .product-image {
      width: 100%; /* Atur lebar gambar */
      height: auto; /* Biarkan ketinggian disesuaikan secara proporsional */
    }
  </style>
</head>
<body>
  <div class="container text-center mt-5">
    <h1>Penilaian Barang</h1>
  </div>
  <div class="container p-5">
    <div class="container p-5 pt-0">
      <div class="container p-5" style="border: 1px solid #000; background-color: #f7f6ff; border-radius: 8px;">
        <form method="post" enctype="multipart/form-data">
            <input type="hidden" name="id_orders" value="<?= $ordid["id_orders"] ?>">
            <?php foreach ($orders as $ord) {
                $id_barang = $ord["id_barang"]; ?>
                <input type="hidden" name="order_id" value="<?= $ord["id_orders"] ?>">
                <div class="container pt-5 pb-5" style="border-bottom: 1px dashed #000;">
                    <div class="row">
                        <div class="col-md-3">
                            <img src="../<?= $ord["img"] ?>" alt="" class="product-image" style="border-radius: 8px;">
                        </div>
                        <div class="col">
                            <h4><?= $ord["nama_barang"] ?></h4>
                            <h5>Kualitas Produk
                                <input type="hidden" name="id_barangs[]" value="<?= $id_barang ?>">
                                <input type="hidden" name="ratings[<?= $id_barang ?>]" class="rating-input" value="0">
                                <span class="rating" data-id="<?= $id_barang ?>">
                                    <span class="star" data-value="1">★</span>
                                    <span class="star" data-value="2">★</span>
                                    <span class="star" data-value="3">★</span>
                                    <span class="star" data-value="4">★</span>
                                    <span class="star" data-value="5">★</span>
                                </span>
                            </h5>
                            <textarea name="ulasan[<?= $id_barang ?>]" class="form-control" cols="30" rows="3" placeholder="Bagikan penilaianmu tentang produk ini untuk membantu Pembeli lain"></textarea>
                            <input type="file" name="foto[<?= $id_barang ?>]" class="form-control mt-3">
                        </div>
                    </div>
                </div>
            <?php } ?>
            <div class="container pt-4" style="text-align: right; padding-right: 50px;">
                <button type="submit" name="submit" class="btn btn-primary btn-lg">Kirim</button>
            </div>
        </form>

      </div>
    </div>
  </div>

  <script>
    document.addEventListener("DOMContentLoaded", function() {
        const ratings = document.querySelectorAll('.rating');

        ratings.forEach(function(rating) {
            const stars = rating.querySelectorAll('.star');
            const input = rating.parentElement.querySelector('.rating-input');

            stars.forEach(function(star) {
                // Event saat bintang diklik
                star.addEventListener('click', function() {
                    const value = parseInt(star.getAttribute('data-value'));

                    // Mewarnai bintang-bintang hingga bintang yang diklik
                    stars.forEach(function(s, i) {
                        if (i < value) {
                            s.style.color = '#ff9328';
                        } else {
                            s.style.color = 'grey';
                        }
                    });

                    // Simpan nilai rating ke dalam input tersembunyi
                    input.value = value;
                });
            });
        });
    });
  </script>

</body>
</html>
