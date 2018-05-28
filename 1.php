<?php 
	session_start();

	// variable declaration
	$username = "";
	$email    = "";
	$errors = array(); 
	$_SESSION['success'] = "";

	// connect to database
	$db = mysqli_connect('localhost', 'root', '', 'fp_mbd');

	$query1 = "SELECT max(no_pelanggan) FROM pelanggan";
			$result = mysqli_query($db,$query1);
			if($rows = $result->fetch_assoc()){
				echo $rows['max(no_pelanggan)'];
		}
?>