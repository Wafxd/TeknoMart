<?php 
include "../db/koneksi.php";
if (!session_id()) session_start();

$id_user = isset($_SESSION['id_user']) ? $_SESSION['id_user'] : null;
$selected_products = isset($_SESSION['selected_cart_items']) ? $_SESSION['selected_cart_items'] : array();

if (isset($_POST["submit"])) {
    // Ambil data penerima
    $penerima = penerima($_POST, $id_user);

    // Mulai transaksi
    mysqli_begin_transaction($conn);
    
    // Tambah order dan dapatkan id_order yang baru
    $id_order = add_orders($_POST); 

    if ($id_order) {
        // Tambah detail order
        $detail_success = add_details($_POST, $id_order); 
        if ($detail_success) {
            $selected_products = isset($_POST['id_barang']) ? $_POST['id_barang'] : array(); 
            
            // Hapus barang dari keranjang
            $hapus_success = hapus_barang_dari_keranjang($conn, $selected_products);
            if ($hapus_success) {
                // Ambil detail barang yang baru ditambahkan
                $barang = query("SELECT * FROM details 
                                INNER JOIN tb_barang USING(id_barang)
                                WHERE id_orders = '$id_order'");
                
                // Update stok barang
                foreach ($barang as $bg) {
                    $id_barang = $bg["id_barang"];
                    $qty = $bg["qty"];
                    $stok_result = mysqli_query($conn, "SELECT * FROM tb_barang WHERE id_barang = '$id_barang'");
                    $stok = mysqli_fetch_assoc($stok_result);
                    $min_stok = $stok["stok"] - $qty;

                    // Update stok barang
                    $update_result = mysqli_query($conn, "UPDATE tb_barang SET stok = '$min_stok' WHERE id_barang = '$id_barang'");
                    if (!$update_result) {
                        mysqli_rollback($conn);
                        echo "<script>
                            alert('Gagal memperbarui stok barang');
                            document.location.href = 'keranjang.php';
                        </script>";
                        exit;
                    }
                }
                // Commit transaksi
                mysqli_commit($conn);
                $_SESSION['id_order'] = $id_order;
                echo "<script>
                    alert('Pesanan berhasil ditambahkan');
                    document.location.href = 'pembayaran.php?id=$id_order';
                </script>";
            } else {
                mysqli_rollback($conn);
                echo "<script>
                    alert('Gagal menghapus barang dari keranjang');
                    document.location.href = 'keranjang.php';
                </script>";
            }
        } else {
            mysqli_rollback($conn);
            echo "<script>
                alert('Gagal menambahkan detail pesanan');
                document.location.href = 'keranjang.php';
            </script>";
        }
    } else {
        mysqli_rollback($conn);
        echo "<script>
            alert('Gagal menambahkan pesanan');
            document.location.href = 'keranjang.php';
        </script>";
    }
}

if (empty($selected_products)) {
    echo "<script>
            alert('Belum ada Barang yang ditambahkan');
            document.location.href = 'keranjang.php';
        </script>";
}

// Ambil data user
$user = query("SELECT * FROM tb_user WHERE id_user = '$id_user'")[0];

// Ambil data order dari keranjang
$order = query("SELECT k.qty, b.* FROM keranjang k 
                INNER JOIN tb_barang b ON k.id_barang = b.id_barang 
                WHERE k.id_barang IN (".implode(",", $selected_products).") AND k.id_user = $id_user");

$jasa = query("SELECT * FROM jasa_kirim");
$metode = query("SELECT * FROM metode");

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>Rincian</title>
  <link rel="stylesheet" href="../css/navbar.css">
</head>
<body>
  <form method="post">
    <nav class="navbar" style="background-color: #6fc3ff; ">
      <div class="container">
        <span class="navbar-brand mb-0 h1">Checkout</span>
      </div>
    </nav>
    <div class="container pt-5">
      <div class="container p-2 p-3" style="background-color:white; border-radius:15px">
          <div class="row align-items-center" style="margin-left: 0; padding-left: 0;">
            <div class="col-auto">
                <img src="../assets/icon/location.png" alt="" height="50px" width="50px">  
              </div>
              <div class="col" style="text-align: left; padding-left: 0;">
                <label for="alamat" style="margin-left:10px">Atur Alamat Penerima</label>
                <input type="text" class="form-control" name="alamat" value="<?= $user["alamat"] ?>">
              </div>
            </div>
            <div class="row align-items-center mt-3" style="margin-left: 0; padding-left: 0;">
              <div class="col-auto">
                <img src="../assets/icon/phone.png" alt="" height="50px" width="50px">  
              </div>
              <div class="col" style="text-align: left; padding-left: 0;">
                <label for="telp" style="margin-left:10px">Atur No telpon Penerima</label>
                <input type="number" class="form-control" name="telp" value="<?= $user["telp"] ?>">
              </div>
            </div>
            <div class="row align-items-center mt-3" style="margin-left: 0; padding-left: 0;">
              <div class="col-auto">
                <img src="../assets/icon/penerima.png" alt="" height="50px" width="50px">  
              </div>
              <div class="col" style="text-align: left; padding-left: 0;">
                <label for="nama" style="margin-left:10px">Atur Nama Penerima</label>
                <input type="text" class="form-control" name="nama" value="<?= $user["nama"] ?>">
              </div>
            </div>
          </div>
      </div>
    </div>
    <div class="container pt-2">
      <div class="container p-4" style="background-color:white; border-radius:15px">
  
        <table class="container text-center" style=" border-bottom: 2px dashed #000;">
          <tr>
            <th style="width:700px;font-size:20px">Produk Dipesan</th>
            <th style="font-size:20px">Harga Satuan</th>
            <th style="font-size:20px">Jumlah</th>
            <th style="font-size:20px">Subtotal Produk</th>
          </tr>
          <tr>
            <td style="padding:30px"></td>
          </tr>
          <?php 
          $total= 0;
          foreach ($order as $ord) {
          ?>
          <tr>
            <td align="left" style="padding-left:160px">
              <p style="font-size:18px">
                <img src="../<?= $ord["img"] ?>" alt="" width="120"> 
                <?= substr($ord["nama_barang"], 0, 32) . "..." ?>
              </p>
            </td>
            <td>
              <p style="font-size:20px">Rp. <?= number_format($ord["harga"], 0, ',', '.') ?></p>  
            </td>
            <td>
              <p style="font-size:20px"><?= $ord["qty"] ?></p>
            </td>
            <?php 
            $sub = $ord["harga"] * $ord["qty"];
            ?>
            <td>
            <p style="font-size:20px">Rp. <?= number_format($sub, 0, ',', '.') ?></p>  
            </td>
          </tr>
          <?php 
          $total += $sub;
          };
          ?>
          <tr>
            <td style="padding:30px"></td>
          </tr>
        </table>
        <table class="container text-center">
          <tr>
            <td style="padding:30px"></td>
          </tr>
          <tr>
            <td style="width: 900px; text-align: right; font-size:18px">Total Harga Produk</td>
            <td style="padding-right:40px"></td>
            <td style="font-size:24px; color:#1E90FF">Rp. <?= number_format($total, 0, ',', '.') ?></td>
          </tr>
          <tr>
            <td style="padding-bottom:30px"></td>
  
          </tr>
        </table>
      </div>
    </div>
      <input type="hidden" name="id_user" value="<?= $id_user ?>">
      <div class="container pt-2">
        <div class="container p-4" style="background-color:white; border-radius:15px">
          <div class="row align-items-center">
            <div class="col-2" align="right">
              <p style="margin: 0; margin-left: 100px; display: flex; align-items: center; height: 100%; font-size:24px">Pesan : </p>
            </div>
            <div class="col-5" style="border-right : 2px dashed #000;">
              <input type="text" name="pesan" class="form-control" placeholder="Tuliskan Pesan Singkat Untuk Penjual">
            </div>
            <div class="col-3">
              <p style="margin: 0; margin-left: 90px; display: flex; align-items: right; height: 100%; font-size:20px">Jasa Kirim : </p>
            </div>
            <div class="col-2">
              <select name="jasa_kirim" id="jasa_kirim" onchange="updateTotal()" style="width: 130px;height:40px; border-radius:7px">
                <option value="" disabled selected>Pilih jasa Kirim</option>
                <?php foreach ($jasa as $js){ ?>
                    <option value="<?= $js["id_jasa"] ?>" data-harga="<?= $js["harga_jasa"] ?>">
                        <?= $js["nama_jasa"] ?>
                </option>
                <?php }
                $layanan = 2000;
                ?>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="container pt-2 pb-5">
        <div class="container text-center p-4" style="background-color : white; border-radius: 10px">
          <div class="container pt-4 pb-3 metode">
            <p class="mtd pb-3" style="font-size:24px">
              Metode Pembayaran
            </p>
            <select name="metode" style="font-size:20px; width:350px; height:40px; border-radius:7px" class="mtd mb-5">
            <?php 
            foreach($metode as $mtd) {
            ?>    
                <option value="<?= $mtd["id_metode"] ?>"><?= $mtd["nama_metode"] ?></option>
              <?php 
              }?>
            </select>
          </div>
          <div class="container pt-2 rincian" style="border-bottom : 1px dashed #000;">
            <p style="font-size:24px">Rincian Pembayaran</p>
            <div class="container pt-5 ">
              <div class="row mx-5 px-5">
                <div class="col">
                  <p style="font-size:24px">Total Harga Produk</p>
                </div>
                <div class="col">
                  <p style="font-size:24px">Rp. <?= number_format($total, 0, ',', '.') ?></p>
                </div>
              </div>
              <div class="row mx-5 px-5">
                <div class="col">
                  <p class="total-text" style="font-size:24px">Total Jasa Kirim</p>
                </div>
                <div class="col" id="total_jasa_kirim">
                  <p class="total-text" style="font-size:24px">Rp. 0</p>
                </div>
              </div>
              <div class="row mx-5 px-5">
                <div class="col">
                  <p style="font-size:24px">Biaya Layanan</p>
                </div>
                <div class="col">
                  <p style="font-size:24px">Rp. <?= number_format($layanan, 0, ',', '.') ?></p>
                </div>
              </div>
              <div class="row mx-5 px-5">
                <div class="col">
                  <p style="font-size:24px">Total Pembayaran</p>
                </div>
                <div class="col" id="total_pembayaran">
                  <p style="font-size:24px">Rp. 0</p>
                </div>
              </div>
            </div>
          </div>
        
            <!-- Hidden input untuk menyimpan informasi tentang barang yang dibeli -->
            <?php foreach ($order as $ord): ?>
              <input type="hidden" name="id_barang[]" value="<?= $ord["id_barang"] ?>">
              <input type="hidden" name="qty[<?= $ord["id_barang"] ?>]" value="<?= $ord["qty"] ?>">
              <input type="hidden" name="harga_satuan[<?= $ord["id_barang"] ?>]" value="<?= $ord["harga"] ?>">
            <?php endforeach; ?>
  
            <button name="submit" type="submit" class="btn btn-success mt-5">
              Buat Pesanan
            </button>
  
      </div>
    </div>
  </form>
  <script>
    function updateTotal() {
      var jasaKirim = document.getElementById("jasa_kirim");
      var selectedOption = jasaKirim.options[jasaKirim.selectedIndex];
      var selectedHarga = parseFloat(selectedOption.getAttribute("data-harga")); // Ambil harga dari atribut data-harga
      var totalHargaProduk = <?= $total ?>;
      var layanan = 2000;

      var totalJasaKirim = selectedHarga;
      var totalPembayaran = totalHargaProduk + totalJasaKirim + layanan;

      var totalJasaKirimElem = document.getElementById("total_jasa_kirim");
      totalJasaKirimElem.style.fontSize = "24px";
      var totalPembayaranElem = document.getElementById("total_pembayaran");
      totalPembayaranElem.style.fontSize = "24px";
      totalPembayaranElem.style.color = "#1E90FF";

      document.getElementById("total_jasa_kirim").innerHTML = "Rp. " + totalJasaKirim.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&.");
      document.getElementById("total_pembayaran").innerHTML = "Rp. " + totalPembayaran.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, "$&.");
    }


    window.addEventListener("beforeunload", function() {
      <?php unset($_SESSION['id_order']); ?> // Hapus session id_order
      <?php unset($_SESSION['selected_cart_items']); ?> 
    });
  </script>
</body>
</html>
