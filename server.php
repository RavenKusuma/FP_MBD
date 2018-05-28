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
			$_SESSION['userid'] = 'G0$temp';
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

	// Booking
	if (isset($_POST['submit_booking'])) {

		$username = $_SESSION['username'];
		$hotel = mysqli_real_escape_string($db, $_POST['hotel']);
		$kamar = mysqli_real_escape_string($db, $_POST['list_kamar']);
		$checkindate = mysqli_real_escape_string($db, $_POST['jadwal_checkin']);
		$checkoutdate = mysqli_real_escape_string($db, $_POST['jadwal_checkout']);

		if (empty($checkindate)) {
			array_push($errors, "Check in date is required");
		}
		if (empty($checkoutdate)) {
			array_push($errors, "Check out date is required");
		}

		#$results = $db->query("SELECT kamar.NO_KAMAR FROM kamar JOIN hotels ON kamar.ID_HOTEL = hotels.ID_HOTEL JOIN type_kamar ON kamar.ID_TYPE_KAMAR = type_kamar.ID_TYPE_KAMAR AND hotels.ID_HOTEL = 'H003' AND type_kamar.ID_TYPE_KAMAR = 'T003'");

		$query = "SELECT 'kamar.NO_KAMAR' FROM kamar JOIN hotels ON 'kamar.ID_HOTEL' = 'hotels.ID_HOTEL' AND 'hotels.ID_HOTEL' = $hotel";
		$results = mysqli_query($db, $query);

		while($rows = $results->fetch_assoc()){
				$temp = $rows['kamar.NO_KAMAR'];
				break;
		}

		if (count($errors) == 0) {

			#$query1 = "SELECT max(no_booking) FROM bookings";
			#$result1 = mysqli_query($db,$query1);
			#if($rows1 = $result1->fetch_assoc()){
			#	$temp1 = $rows['max(no_booking)'] + 1;
			#}

			#$query = "INSERT INTO bookings (no_booking, id_booking, no_kamar, id_pelanggan, tgl_checkin, tgl_checkout, status_booking) 
					  #VALUES('$temp1', 'B0$temp1', '$temp', '$username', '$checkindate', '$checkoutdate', 'ONGOING')";

			$query2 = "INSERT INTO bookings (id_booking, no_kamar, id_pegawai, id_pelanggan, tgl_checkin, tgl_checkout, status_booking) 
					  VALUES('B035', 'K003', 'P001', 'G031', '$checkindate', '$checkoutdate', 'ONGOING')";
			mysqli_query($db, $query2) or die(mysqli_error($db));

			$_SESSION['success'] = $temp;
			header('location: about.php');
		}
	}

	
?>