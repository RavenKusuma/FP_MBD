<?php 

	if(isset($_COOKIE['user'])) {
   	$_SESSION['username'] = $_COOKIE['user'];
   	$usern = $_SESSION['username'];
	}

	if (!isset($_SESSION['username'])) {
		$_SESSION['msg'] = "You must log in first";
		header('location: login.php');
	}

	if (isset($_GET['logout'])) {
		session_destroy();
		unset($_SESSION['username']);
		header("location: login.php");
	}

?>