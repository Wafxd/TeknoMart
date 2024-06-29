<?php 
$host = "localhost:3306";
$user = "root";
$password = "";
$dbname = "tecp5312_elektronik";

$conn = mysqli_connect($host, $user, $password, $dbname);

function query($query){
    global $conn;
    $result = mysqli_query($conn, $query);
    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }
    return $rows;
}


function add_user($data) {
    global $conn;
    $username = $data["username"];
    $nama = $data["nama"];
    $alamat = $data["alamat"];
    $email = $data["email"];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $query = "INSERT INTO tb_user(id_user, username, nama, alamat, email, password) VALUES('', '$username', '$nama', '$alamat', '$email', '$password')";
    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

function add_orders($data) {
    global $conn;

    $id_user = $data["id_user"];
    $id_jasa = $data["jasa_kirim"]; // Sesuaikan dengan nama input pada formulir
    $id_metode = $data["metode"]; // Sesuaikan dengan nama input pada formulir
    $pesan = $data["pesan"]; // Sesuaikan dengan nama input pada formulir
    $konfirmasi = "Belum Terkonfirmasi";
    $status = "Belum Bayar";
    $tanggal_sekarang = date("Y-m-d H:i:s");
    $query = "INSERT INTO orders(id_orders, id_user, id_jasa, id_metode, tanggal, pesan, konfirmasi, status) VALUES('', '$id_user', '$id_jasa', '$id_metode', '$tanggal_sekarang', '$pesan', '$konfirmasi', '$status')";
    mysqli_query($conn, $query);
    return mysqli_insert_id($conn); // Mengembalikan ID pesanan yang baru saja dibuat
}


function add_details_now($data, $id_order) {
    global $conn;
    $id_barang = $data["id_barang"];
    $qty = $data["qty"];
    $harga_satuan = $data["harga_satuan"];
    $query = "INSERT INTO details (id_orders, id_barang, harga_satuan, qty) VALUES('$id_order', '$id_barang', '$harga_satuan', '$qty')";
    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

function add_details($data, $id_order) {
    global $conn;
    $id_barang = isset($data["id_barang"]) ? $data["id_barang"] : array();
    $qty = isset($data["qty"]) ? $data["qty"] : array();
    $harga_satuan = isset($data["harga_satuan"]) ? $data["harga_satuan"] : array();
    $rating = isset($data["rating"]) ? $data["rating"] : array();
    $ulasan = isset($data["ulasan"]) ? $data["ulasan"] : array();
    $foto = isset($data["foto"]) ? $data["foto"] : array();

    // Loop untuk menambahkan detail pesanan berdasarkan barang yang dipilih
    foreach ($id_barang as $barang) {
        $qty_barang = $qty[$barang];
        $harga_satuan_barang = $harga_satuan[$barang];
        $rating_barang = isset($rating[$barang]) ? $rating[$barang] : 0; // Default value for rating
        $ulasan_barang = isset($ulasan[$barang]) ? $ulasan[$barang] : ""; // Default value for ulasan
        $foto_barang = isset($foto[$barang]) ? $foto[$barang] : ""; // Default value for foto

        // Masukkan data detail pesanan ke dalam database
        $stmt = $conn->prepare("INSERT INTO details (id_orders, id_barang, harga_satuan, qty, rating, ulasan, foto) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("iiiisss", $id_order, $barang, $harga_satuan_barang, $qty_barang, $rating_barang, $ulasan_barang, $foto_barang);
        $stmt->execute();
    }
    // Mengembalikan jumlah baris yang terpengaruh
    return count($id_barang);
}



function rupiah($angka){
    $hasil_rupiah = "Rp. " . number_format($angka, 0, ',', '.');
    return $hasil_rupiah;
}

function add_keranjang($data) {
    global $conn;
    $id = $data["id_barang"];
    $user = $_SESSION["id_user"];
    $qty = $data["qty"];

    $query = "INSERT INTO keranjang(id_barang, id_user, qty) VALUES('$id', $user, '$qty')";
    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

function cek_keranjang($id_barang, $id_user) {
    global $conn;

    $query = "SELECT * FROM keranjang WHERE id_barang = '$id_barang' AND id_user = '$id_user'";
    $result = mysqli_query($conn, $query);

    return mysqli_num_rows($result);
}



function hapusBarang($id_user, $id_barang) {
    global $conn;
    $stmt = $conn->prepare("DELETE FROM keranjang WHERE id_user = ? AND id_barang = ?");
    $stmt->bind_param("ii", $id_user, $id_barang);
    return $stmt->execute();
}

function hapus_barang_dari_keranjang($conn, $id_barang) {
    $id_barang_string = implode(',', $id_barang); // Mengubah array ID barang menjadi string untuk digunakan dalam query
    $query = "DELETE FROM keranjang WHERE id_barang IN ($id_barang_string)";
    return mysqli_query($conn, $query);
}

function add_produk($data) {
    global $conn;
    $nama = $data["nama_barang"];
    $kategori = $data["kategori"];
    $merk = $data["merk"];
    $stok = $data["stok"];
    $keterangan = $data["keterangan"];
    $img = $_FILES["img"];
    $harga_beli = $data['harga'];
    
    if ($harga_beli <= 1000000) {
        $omset = 30/100;
    } elseif ($harga_beli <= 5000000) {
        $omset = 20/100;
    } elseif ($harga_beli <= 15000000) {
        $omset = 10/100;
    } elseif ($harga_beli <= 25000000) {
        $omset = 8/100;
    } elseif ($harga_beli <= 50000000) {
        $omset = 5/100;
    }
    
    $harga_jual = $harga_beli * $omset;
    $harga = $harga_beli + $harga_jual;
    $nama_file = uniqid() . '_' . $img['name'];
    $tujuan = '../assets/img/' . $nama_file;
    move_uploaded_file($img['tmp_name'], $tujuan);
    $nama_file_database = 'assets/img/' . $nama_file;

    $query = "INSERT INTO tb_barang(nama_barang, harga, img, kategori, merk, keterangan, stok, terjual) VALUES ('$nama', '$harga', '$nama_file_database', '$kategori', '$merk', '$keterangan', '$stok', '')";
    
    if (mysqli_query($conn, $query)) {
        return mysqli_insert_id($conn);
    } else {
        return false;
    }
}



function add_stok($data) {
    global $conn;
    $id = $data["id_barang"];
    $stok = $data["stok"];

    $brg = query("SELECT stok FROM tb_barang WHERE id_barang = '$id'")[0];
    $new_stok = $brg["stok"] + $stok;

    $query = "UPDATE tb_barang SET stok = '$new_stok' WHERE id_barang = '$id'";
    return mysqli_query($conn, $query);
}

function singkat($nama_barang) {
    if (strlen($nama_barang) > 20) {
        $nama_pendek = substr($nama_barang, 0, 20);
        $posisi_spasi = strrpos($nama_pendek, ' ');
        if ($posisi_spasi !== false) {
            $nama_pendek = substr($nama_pendek, 0, $posisi_spasi);
        }
        $nama_pendek .= '...';
        return $nama_pendek;
    } else {
        return $nama_barang;
    }
}

function edit_produk($data) {
    global $conn;
    $id = $data["id_barang"];
    $nama_barang = $data["nama_barang"];
    $kategori = $data["kategori"];
    $merk = $data["merk"];
    $harga = $data["harga"];
    $keterangan = $data["keterangan"];

    $query = "UPDATE tb_barang SET 
                nama_barang = '$nama_barang', 
                kategori = '$kategori', 
                merk = '$merk', 
                harga = '$harga', 
                keterangan = '$keterangan'
                WHERE id_barang = '$id'";
    return mysqli_query($conn, $query);
}

function hapus_produk($id_barang) {
    global $conn;
    $query = "DELETE FROM tb_barang WHERE id_barang = '$id_barang'";
    if (mysqli_query($conn, $query)) {
        return true; 
    } else {
        return false; 
    }
    mysqli_close($conn);
}


function upbukti($data) {
    global $conn;
    $id_orders = $data["id_orders"];
    $bukti = $_FILES["bukti"];
    $status = "Menunggu Konfirmasi";
    
    $nama_file = uniqid() . '_' . $bukti['name'];
    $tujuan = '../upload/' . $nama_file;
    move_uploaded_file($bukti['tmp_name'], $tujuan);
    $nama_file_database = 'upload/' . $nama_file;

    $query = "UPDATE orders SET 
                bukti_pembayaran = '$nama_file_database', 
                status = '$status'
                WHERE id_orders = '$id_orders'";
    return mysqli_query($conn, $query);
}

function confirm($data) {
    global $conn;
    $id_orders = $data["id_orders"];
    $konfirmasi = "Terkonfirmasi";
    $status = "Diproses";
    $query = "UPDATE orders SET
                konfirmasi = '$konfirmasi',
                status = '$status'
                WHERE id_orders = '$id_orders'";
    return mysqli_query($conn, $query);
}


function kirim($data) {
    global $conn;
    $id_orders = $data["id_orders"];
    $status = "Dikirim";
    $query = "UPDATE orders SET
                status = '$status'
                WHERE id_orders = '$id_orders'";
    return mysqli_query($conn, $query);
}


function add_to_tb_rate($id_orders, $id_user, $id_barang, $rating, $ulasan, $foto) {
    global $conn;
    
    // Escape input untuk mencegah SQL injection
    $id_orders = mysqli_real_escape_string($conn, $id_orders);
    $id_user = mysqli_real_escape_string($conn, $id_user);
    $id_barang = mysqli_real_escape_string($conn, $id_barang);
    $rating = mysqli_real_escape_string($conn, $rating);
    $ulasan = mysqli_real_escape_string($conn, $ulasan);
    $foto = mysqli_real_escape_string($conn, $foto);
    
    // Query untuk menambahkan rating ke dalam database
    $query = "INSERT INTO tb_rate (id_orders, id_user, id_barang, rating, ulasan, foto) VALUES ('$id_orders', '$id_user', '$id_barang', '$rating', '$ulasan', '$foto')";
    mysqli_query($conn, $query);
    
    // Mengembalikan jumlah baris yang terpengaruh oleh operasi query
    return mysqli_affected_rows($conn);
}

function add_rating($id_orders, $id_barang, $rating, $ulasan, $foto) {
    global $conn;

    $query = "UPDATE details SET rating = '$rating', ulasan = '$ulasan', foto = '$foto' WHERE id_orders = '$id_orders' AND id_barang = '$id_barang'";
    return mysqli_query($conn, $query);
}



function selesai($id_orders) {
    global $conn;
    $status = "Selesai";
    $query = "UPDATE orders SET status = '$status' WHERE id_orders = '$id_orders'";
    return mysqli_query($conn, $query);
}


function pengeluaranstok($data) {
    global $conn;
    $id_barang = $data['id_barang'];
    $harga_jual = $data['harga'];
    if ($harga_jual <= 1000000) {
        $omset = 30/100;
    }elseif ($harga_jual <= 5000000) {
        $omset = 20/100;
    }elseif ($harga_jual <= 15000000) {
        $omset = 10/100;
    }elseif ($harga_jual <= 25000000) {
        $omset = 8/100;
    }elseif ($harga_jual <= 50000000) {
        $omset = 5/100;
    }
    $harga_beli = $harga_jual * $omset;
    $harga = $harga_jual - $harga_beli;
    $qty = $data['stok'];
    $tgl = date("Y-m-d H:i:s");

    $query = "INSERT INTO tb_pengeluaran (id_pengeluaran, id_barang, harga, qty, tanggal) VALUES ('', '$id_barang', '$harga', '$qty', '$tgl')";
    return mysqli_query($conn, $query);
}

function add_pengeluaran($data , $id_barang) {
    global $conn;
    $harga_beli = $data['harga'];
    $qty = $data['stok'];
    $tgl = date("Y-m-d H:i:s");

    $query = "INSERT INTO tb_pengeluaran (id_pengeluaran, id_barang, harga, qty, tanggal) VALUES ('', '$id_barang', '$harga_beli', '$qty', '$tgl')";
    return mysqli_query($conn, $query);
}

function add_retur($data, $file) {
    global $conn;
    $id_orders = $data["id_orders"];
    $tgl = date("Y-m-d H:i:s");
    $alasan = $data["alasan"];
    $status = "Menunggu";

    $nama_file = uniqid() . '_' . $file["bukti"]["name"];
    $tujuan = '../upload/' . $nama_file;
    move_uploaded_file($file["bukti"]["tmp_name"], $tujuan);
    $nama_file_database = 'upload/' . $nama_file;

    // Insert the refund data into the refunds table
    $query = "INSERT INTO tb_refund (id_refund, id_orders, tanggal, alasan, bukti, status_refund) VALUES ('', '$id_orders', '$tgl', '$alasan', '$nama_file_database', '$status')";
    return mysqli_query($conn, $query);
}

function retur($id_orders) {
    global $conn;
    $status = "Diajukan Retur";
    $query = "UPDATE orders SET status = '$status' WHERE id_orders = '$id_orders'";
    return mysqli_query($conn, $query);
}

function penerima($data, $id_user){
    global $conn;
    $nama = $data["nama"];
    $telp = $data["telp"];
    $alamat = $data["alamat"];

    $query = "UPDATE tb_user SET 
                nama = '$nama', 
                telp = '$telp', 
                alamat = '$alamat'
                WHERE id_user = '$id_user'";
    return mysqli_query($conn, $query);
}

function batal($id_orders) {
    global $conn;
    $status = "Dibatalkan";
    $query = "UPDATE orders SET status = '$status' WHERE id_orders = '$id_orders'";
    return mysqli_query($conn, $query);
}


function confirm_retur($data) {
    global $conn;
    $id_orders = $data["id_orders"];
    $konfirmasi = "Diterima";
    $status = "Retur";

    $query1 = "UPDATE orders SET
                status = '$status'
                WHERE id_orders = '$id_orders'";
    $orders = mysqli_query($conn, $query1);

    $query2 = "UPDATE tb_refund SET
                status_refund = '$konfirmasi'
                WHERE id_orders = '$id_orders'";
    $tb_refund = mysqli_query($conn, $query2);

    return $orders && $tb_refund;
}

function tolak_retur($data) {
    global $conn;
    $id_orders = $data["id_orders"];
    $konfirmasi = "Ditolak";
    $status = "Retur";

    $query1 = "UPDATE orders SET
                status = '$status'
                WHERE id_orders = '$id_orders'";
    $orders = mysqli_query($conn, $query1);

    $query2 = "UPDATE tb_refund SET
                status_refund = '$konfirmasi'
                WHERE id_orders = '$id_orders'";
    $tb_refund = mysqli_query($conn, $query2);

    return $orders && $tb_refund;
}

function ubah($id_user, $data) {
    global $conn;
    $nama = $data["nama"];
    $alamat = $data["alamat"];
    $telp = $data["telp"];

    $query = "UPDATE tb_user SET
                nama = '$nama',
                alamat = '$alamat',
                telp = '$telp'
                where id_user = '$id_user'";
    return mysqli_query($conn, $query);
}
?>