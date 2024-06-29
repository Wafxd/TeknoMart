<?php 
session_start();
include "../db/koneksi.php";

$user = $_SESSION["id_user"];
$id = $_GET["id"];

$details = query("SELECT * FROM orders 
                  INNER JOIN details USING(id_orders)
                  INNER JOIN tb_barang USING(id_barang)
                  INNER JOIN tb_user USING(id_user)
                  WHERE id_orders = '$id'");

if (isset($_POST["submit"])) {
    if (!empty($_POST["id_orders"]) && !empty($_POST["alasan"]) && !empty($_FILES["bukti"])) {
        if (add_retur($_POST, $_FILES)) {
            retur($_POST["id_orders"]);
            echo "<script>
                alert('Pengajuan Retur Berhasil dikirimkan.');
                window.location.href = 'pesanan.php'; 
            </script>";
        } else {
            echo "<script>
                alert('Gagal Mengirim Pengajuan Retur.');
                history.back();
            </script>";
        }
    } else {
        echo "<script>
            alert('Semua Form harus diisi.');
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
    <title>Refund</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/stylehome.css">
    <link rel="stylesheet" href="../css/navbar.css">
    <style>
        .fixed-size-img {
            width: 75px;
            height: 75px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <nav class="navbar" style="background-color: #6fc3ff;">
        <div class="container">
            <span class="navbar-brand mb-0 h1">Retur</span>
        </div>
    </nav>
    <div class="container p-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="container p-3" style="background-color: white; border-radius:8px; box-shadow: 4px 6px 15px rgba(0, 0, 0, 0.2);">
                        <form method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id_orders" value="<?= $id ?>">
                            <input type="hidden" name="id_user" value="<?= $user ?>">
                            <h4 class="text-center">Form Retur</h4>
                            <div class="container">
                                <label for="alasan"><p style="font-size : 18px ; margin-left:20px ; margin-top:20px">Alasan</p></label>
                                <textarea name="alasan" class="form-control" cols="30" rows="5"></textarea>
                                <label for="bukti"><p style="font-size : 18px ; margin-left:20px ; margin-top:20px">Bukti</p></label>
                                <input class="form-control" type="file" name="bukti">
                                <div class="container text-center">
                                    
                                <button class="btn btn-primary mt-5 text-center" name="submit">Ajukan Pengembalian</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-4">
                    <div class="container text-center" style="background-color: white; border-radius:8px; box-shadow: 4px 6px 15px rgba(0, 0, 0, 0.2);">
                        <h5 class="pt-3">Produk</h5>
                        <div class="container p-3">
                            <?php foreach ($details as $dt) { ?>
                                <div class="row align-items-center mb-3" style="border-radius:5px; box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);">
                                    <div class="col-auto">
                                        <img src="../<?= $dt["img"] ?>" alt="<?= $dt["nama_barang"] ?>" class="img-fluid fixed-size-img">
                                    </div>
                                    <div class="col-auto">
                                        <p><?= substr($dt["nama_barang"], 0, 20) . "..." ?></p>
                                    </div>
                                    <div class="col">
                                        <p><?= $dt["qty"] ?></p>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
