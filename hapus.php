<?php

include("server.php");

if( isset($_GET['id']) ){

	// ambil id dari query string
	$id = $_GET['id'];

	// buat query hapus
	$sql = "DELETE FROM pegawai WHERE id_pegawai=$id";
	$query = mysqli_query($db, $sql);

	// apakah query hapus berhasil?
	if( $query ){
		header('Location: karyawan.php');
	} else {
		die("gagal menghapus...");
	}

} else {
	die("akses dilarang...");
}

?>