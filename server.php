<?php 
	session_start();

	// variable declaration
	$username = "";
	$email    = "";
	$errors = array(); 
	$_SESSION['success'] = "";

	// connect to database
	$db = mysqli_connect('localhost', 'root', '', 'fp_mbd');

	// REGISTER USER
	if (isset($_POST['reg_user'])) {
		// receive all input values from the form
		$username = mysqli_real_escape_string($db, $_POST['username']);
		$password_1 = mysqli_real_escape_string($db, $_POST['password_1']);
		$password_2 = mysqli_real_escape_string($db, $_POST['password_2']);
		$nama = mysqli_real_escape_string($db, $_POST['nama']);
		$alamat = mysqli_real_escape_string($db, $_POST['alamat']);
		$no_tlp = mysqli_real_escape_string($db, $_POST['no_tlp']);
		$tgl_lahir = mysqli_real_escape_string($db, $_POST['tgl_lahir']);

		// form validation: ensure that the form is correctly filled
		if (empty($username)) { array_push($errors, "Username is required"); }
		if (empty($password_1)) { array_push($errors, "Password is required"); }

		if ($password_1 != $password_2) {
			array_push($errors, "The two passwords do not match");
		}

		// register user if there are no errors in the form
		if (count($errors) == 0) {
			$password = md5($password_1);//encrypt the password before saving in the database

			$query1 = "SELECT max(no_pelanggan) FROM pelanggan";
			$result = mysqli_query($db,$query1);
			if($rows = $result->fetch_assoc()){
				$temp = $rows['max(no_pelanggan)'] + 1;
			}

			$query = "INSERT INTO pelanggan (no_pelanggan, id_pelanggan, username_pelanggan, password_pelanggan, nama_pelanggan, alamat_pelanggan, tlp_pelanggan, tgl_lahir) 
					  VALUES('$temp', 'G0$temp', '$username', '$password', '$nama', '$alamat', '$no_tlp', '$tgl_lahir')";
			mysqli_query($db, $query);


			$_SESSION['username'] = $username;
			$_SESSION['success'] = "You are now logged in";
			header('location: index.php');
		}

	}

	// LOGIN USER
	if (isset($_POST['login_user'])) {
		$username = mysqli_real_escape_string($db, $_POST['username']);
		$password = mysqli_real_escape_string($db, $_POST['password']);

		if (empty($username)) {
			array_push($errors, "Username is required");
		}
		if (empty($password)) {
			array_push($errors, "Password is required");
		}

		if (count($errors) == 0) {
			$password = md5($password);
			$query = "SELECT * FROM pelanggan WHERE username_pelanggan='$username' AND password_pelanggan='$password'";
			$results = mysqli_query($db, $query);

			if (mysqli_num_rows($results) == 1) {
				if(!empty($_POST["remember"])) {
        			setcookie ("user_login",$_POST["username"],time()+ (10 * 365 * 24 * 60 * 60));
        			setcookie ("password",$_POST["password"],time()+ (10 * 365 * 24 * 60 * 60));
      			} else {
        			if(isset($_COOKIE["user_login"])) {
          				setcookie ("user_login","");
        			}
        			if(isset($_COOKIE["password"])) {
          				setcookie ("password","");
        			}
     			}
				$_SESSION['username'] = $username;
				$_SESSION['success'] = "You are now logged in";
				header('location: index.php');
			}else {
				array_push($errors, "Wrong username/password combination");
			}
		}
	}

	// LOGIN USER
	if (isset($_POST['submit'])) {
		$username = mysqli_real_escape_string($db, $_POST['username']);
		$password = mysqli_real_escape_string($db, $_POST['password']);
		$checkindate = mysqli_real_escape_string($db, $_POST['password']);
		$checkoutdate = mysqli_real_escape_string($db, $_POST['password']);


		if (empty($username)) {
			array_push($errors, "Username is required");
		}
		if (empty($password)) {
			array_push($errors, "Password is required");
		}

		if (count($errors) == 0) {
			$password = md5($password);
			$query = "SELECT * FROM pelanggan WHERE username_pelanggan='$username' AND password_pelanggan='$password'";
			$results = mysqli_query($db, $query);

			if (mysqli_num_rows($results) == 1) {
				if(!empty($_POST["remember"])) {
        			setcookie ("user_login",$_POST["username"],time()+ (10 * 365 * 24 * 60 * 60));
        			setcookie ("password",$_POST["password"],time()+ (10 * 365 * 24 * 60 * 60));
      			} else {
        			if(isset($_COOKIE["user_login"])) {
          				setcookie ("user_login","");
        			}
        			if(isset($_COOKIE["password"])) {
          				setcookie ("password","");
        			}
     			}
				$_SESSION['username'] = $username;
				$_SESSION['success'] = "You are now logged in";
				header('location: index.php');
			}else {
				array_push($errors, "Wrong username/password combination");
			}
		}
	}

?>