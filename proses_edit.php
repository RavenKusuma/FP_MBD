<?php

include("server.php");

// cek apakah tombol simpan sudah diklik atau blum?
if(isset($_POST['simpan'])){

	// ambil data dari formulir
	$id = $_POST['id'];
	$nama = $_POST['nama_pegawai'];
	$alamat = $_POST['alamat'];
	$telp = $_POST['telp_pegawai'];

	// buat query update
	$sql = "UPDATE pegawai SET nama_pegawai='$nama', alamat='$alamat', tlp_pegawai='$telp' WHERE id_pegawai=$id";
	$query = mysqli_query($db, $sql);

	// apakah query update berhasil?
	if( $query ) {
		// kalau berhasil alihkan ke halaman list-siswa.php
		header('Location: karyawan.php');
	} else {
		// kalau gagal tampilkan pesan
		die("Gagal menyimpan perubahan...");
	}


} else {
	die("Akses dilarang...");
}

?>