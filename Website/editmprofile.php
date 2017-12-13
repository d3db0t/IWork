<?php session_start();?>
<html>
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/editprofile.css">

	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">IWork</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="mprofile.php">Profile <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">Requests</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="">Applications<span class="badge badge-success badge-pill" style='background-color: #34B3A0;color: white'>14</span></a>
                    
				</li>
				</ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="logout.php" style='color: #34B3A0'><button type="button" class="btn btn-outline-primary">Logout</button></a>
                    </li>
                </ul>
			</div>
		</nav>

        <?php
            include('dbconfig.php');
            include('functions.php');
            $manager = $_SESSION['username'];
			editUserProfile($manager, $conn);
			if($_SERVER["REQUEST_METHOD"] == "POST")
			{
				// Password
				$p           = "SELECT password FROM Users WHERE username = '$manager'";
				$getPassword = sqlsrv_query($conn, $p);
				$password    = sqlsrv_fetch_array($getPassword, SQLSRV_FETCH_ASSOC)['password'];
				if (!empty($_POST['password'])){$password = $_POST['password'];};
				// Experience Years
				$e                  = "SELECT experience_years FROM Users WHERE username = '$manager'";
				$getExperienceYears = sqlsrv_query($conn, $e);
				$experienceYears    = sqlsrv_fetch_array($getExperienceYears, SQLSRV_FETCH_ASSOC)['experience_years'];
				if (!empty($_POST['experience_years'])){$experienceYears = $_POST['experience_years'];};
				// First Name
				$fn           = "SELECT first_name FROM Users WHERE username = '$manager'";
				$getFirstName = sqlsrv_query($conn, $fn);
				$firstName    = sqlsrv_fetch_array($getFirstName, SQLSRV_FETCH_ASSOC)['first_name'];
				if (!empty($_POST['first_name'])){$firstName = $_POST['first_name'];};
				// Middle Name
				$mn            = "SELECT middle_name FROM Users WHERE username = '$manager'";
				$getMiddleName = sqlsrv_query($conn, $mn);
				$middleName    = sqlsrv_fetch_array($getMiddleName, SQLSRV_FETCH_ASSOC)['middle_name'];
				if (!empty($_POST['middle_name'])){$middleName = $_POST['middle_name'];};
				// Last Name
				$ln          = "SELECT last_name FROM Users WHERE username = '$manager'";
				$getLastName = sqlsrv_query($conn, $ln);
				$lastName    = sqlsrv_fetch_array($getLastName, SQLSRV_FETCH_ASSOC)['last_name'];
				if (!empty($_POST['last_name'])){$lastName = $_POST['last_name'];};
				
				$q = "EXEC EditUserInfo '$manager', '$password', '$experienceYears', '$firstName', '$middleName', '$lastName'";
				$results = sqlsrv_query($conn, $q);
				$rows_affected = sqlsrv_rows_affected($results);
				if($rows_affected > 0)
                {
                    header("Location: mprofile.php");
                }
                else
                {
                    die
                    (
                        "<div class='alert alert-dismissible alert-danger'>
                        <button type='button' class='close' data-dismiss='alert'>&times;</button>
                        <strong>Oh snap!</strong> There was an error while updating your profile! </div>"
                    ); 
                }

			}
        ?>
    </body>
</html>