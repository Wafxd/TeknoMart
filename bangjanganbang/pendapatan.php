<?php
include '../db/koneksi.php';

$tanggal_awal = $_GET['tanggal_awal'] ?? '';
$tanggal_akhir = $_GET['tanggal_akhir'] ?? '';

$data = query("SELECT orders.tanggal, SUM(details.harga_satuan * details.qty) AS pemasukan 
                  FROM orders
                  INNER JOIN details using(id_orders)
                  WHERE orders.tanggal BETWEEN '$tanggal_awal' AND '$tanggal_akhir' AND status = 'Selesai'
                  GROUP BY orders.tanggal");

$data_pemasukan_json = json_encode($data);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard Tekno</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="index.php">Admin Tekno</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>

    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="index.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>
                        <div class="sb-sidenav-menu-heading">Interface</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayout">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Pesanan
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="batal.php">Pesanan Dibatalkan</a>
                                <a class="nav-link" href="konfirmasi.php">Konfirmasi Pesanan</a>
                                <a class="nav-link" href="diproses.php">Untuk Dikirim</a>
                                <a class="nav-link" href="selesai.php">Pesanan Selesai</a>
                                <a class="nav-link" href="refund.php">Pengajuan Retur</a>
                            </nav>
                        </div>

                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Manajemen Produk
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="all_product.php">Lihat Semua Produk</a>
                                <a class="nav-link" href="edit_product.php">Edit & Hapus Produk</a>
                                <a class="nav-link" href="add_product.php">Tambah Produk & Stok</a>
                            </nav>
                        </div>
                    
                        <div class="sb-sidenav-menu-heading">Addons</div>
                        <a class="nav-link active" href="pendapatan.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Pemasukan
                        </a>
                        <a class="nav-link" href="pengeluaran.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Pengeluaran
                        </a>
                        <a class="nav-link" href="user.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            Pelanggan
                        </a>
                    </div>
                </div>
                
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    
                    <h1 class="mt-4">Addons</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">Pendapatan</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="input-group p-3">
                            <input type="date" class="form-control" name="tanggal_awal" id="tanggal_awal">
                            <span class="input-group-text">to</span>
                            <input type="date" class="form-control" name="tanggal_akhir" id="tanggal_akhir">
                            <button class="btn btn-primary" id="filterTanggal">Filter</button>
                        </div>
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Pendapatan
                        </div>
                        <div class="card-body">
                            <!-- Canvas untuk grafik pengeluaran -->
                            <canvas id="pemasukanChart"></canvas>
                        </div>
                        <div class="card-footer">
                            <a href="revenue.php?tanggal_awal=<?= $tanggal_awal ?>&tanggal_akhir=<?= $tanggal_akhir ?>" class="btn btn-primary">Export to CSV</a>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Tekno Mart</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        
    </div>
    <script>
        const dataPemasukan = <?php echo $data_pemasukan_json; ?>;
        const labels = dataPemasukan.map(item => item.tanggal);
        const pemasukan = dataPemasukan.map(item => item.pemasukan);
        const ctx = document.getElementById('pemasukanChart').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Pemasukan',
                    data: pemasukan,
                    backgroundColor: 'rgba(255, 159, 64, 0.2)',
                    borderColor: 'rgba(255, 159, 64, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        document.getElementById('filterTanggal').addEventListener('click', function() {
            const tanggalAwal = document.getElementById('tanggal_awal').value;
            const tanggalAkhir = document.getElementById('tanggal_akhir').value;

            // Redirect to the same page with filter query parameters
            window.location.href = `pendapatan.php?tanggal_awal=${tanggalAwal}&tanggal_akhir=${tanggalAkhir}`;
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
</body>
</html>
