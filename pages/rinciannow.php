<?php 
include "../db/koneksi.php";
if (!session_id()) session_start();

$id_user = isset($_SESSION['id_user']) ? $_SESSION['id_user'] : null;
$id_order = isset($_SESSION['id_order']) ? $_SESSION['id_order'] : null;
$id_barang = isset($_SESSION['id_barang']) ? $_SESSION['id_barang'] : null; // Ambil id_barang dari session
$qty = isset($_SESSION['qty']) ? $_SESSION['qty'] : null; // Ambil qty dari session

if (isset($_POST["submit"])) {
  $penerima = penerima($_POST, $id_user);
  mysqli_begin_transaction($conn);
  $id_order = add_orders($_POST); 
  if ($id_order) {
      $detail_success = add_details_now($_POST, $id_order); 
      if ($detail_success) {
          // Ambil stok barang saat ini
          $jumlah = $_POST["qty"];
          $barang = $_POST["id_barang"];
          $stok_result = mysqli_query($conn, "SELECT stok FROM tb_barang WHERE id_barang = '$barang'");
          if ($stok_result) {
              $stok = mysqli_fetch_assoc($stok_result);
              $min_stok = $stok["stok"] - $jumlah;

              // Update stok barang
              $update_result = mysqli_query($conn, "UPDATE tb_barang SET stok = '$min_stok' WHERE id_barang = '$barang'");
              if ($update_result) {
                  mysqli_commit($conn);
                  $_SESSION['id_order'] = $id_order;
                  echo "<script>
                      alert('Pesanan berhasil ditambahkan');
                      document.location.href = 'pembayaran.php?id=$id_order';
                  </script>";
              } else {
                  mysqli_rollback($conn);
                  // Debugging message
                  echo "Error updating stock: " . mysqli_error($conn);
                  echo "<script>
                      alert('Gagal memperbarui stok barang');
                      document.location.href = 'keranjang.php';
                  </script>";
              }
          } else {
              mysqli_rollback($conn);
              // Debugging message
              echo "Error fetching stock: " . mysqli_error($conn);
              echo "<script>
                  alert('Gagal mengambil stok barang');
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

// Ambil ID pengguna yang sedang login
$id_user = isset($_SESSION['id_user']) ? $_SESSION['id_user'] : null;

$user = query("SELECT * FROM tb_user WHERE id_user = '$id_user'")[0];

$order = query("SELECT * FROM tb_barang where id_barang = '$id_barang'")[0];

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
  <nav class="navbar" style="background-color: #6fc3ff; ">
    <div class="container">
      <span class="navbar-brand mb-0 h1">Checkout</span>
    </div>
  </nav>
  <form method="post">
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
          ?>
          <tr>
            <td align="left" style="padding-left:160px">
              <p style="font-size:18px">
                <img src="../<?= $order["img"] ?>" alt="" width="120"> 
                <?= substr($order["nama_barang"], 0, 32) . "..." ?>
              </p>
            </td>
            <td>
              <p style="font-size:20px">Rp. <?= number_format($order["harga"], 0, ',', '.') ?></p>  
            </td>
            <td>
              <p style="font-size:20px"><?= $qty ?></p>
            </td>
            <?php 
            $sub = $order["harga"] * $qty;
            ?>
            <td>
            <p style="font-size:20px">Rp. <?= number_format($sub, 0, ',', '.') ?></p>  
            </td>
          </tr>
          <?php 
          $total += $sub;
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
            
              <input type="hidden" name="id_barang" value="<?= $id_barang ?>">
              <input type="hidden" name="qty" value="<?= $qty ?>">
              <input type="hidden" name="harga_satuan" value="<?= $order["harga"] ?>">

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
    <?php unset($_SESSION['id_barang']); ?> // Hapus session selected_cart_items
    <?php unset($_SESSION['qty']); ?> // Hapus session selected_cart_items
  });

  </script>
</body>
</html>
