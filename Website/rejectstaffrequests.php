<?php 
    session_start();
	include('mnavbarcounts.php');
?>
<html>
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/rejectstaffrequests.css">

	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">IWork</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="mhome.php">Home</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="mprofile.php">Profile</a>
                </li>
				<li class="nav-item active">
                    <a class="nav-link" href="staffrequests.php">StaffRequests <span class="sr-only">(current)</span><span class="badge badge-success badge-pill" style='background-color: #34B3A0;color: white'><?php echo $staffRequestsCount ?></span></a>
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

        <form role='form' class='form-signin' action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <div class="form-group">
                    <p class='formtitles' >Reason for Rejection</p>
                    <input id="reason" class="form-control" type="text" name="reason" placeholder="reason">
                </div>
                
                <button type='submit' class='btn btn-danger' style='border-color: #34B3A0' >Reject</button>
		</form>

        <?php
            include('functions.php');
            if (isset($_GET['code']))
            {
                if ($_SERVER["REQUEST_METHOD"] == "POST")
                {
                    ManagerRejectRequests($manager, $_GET['code'], $_POST['reason'], $conn);
                    header("Location: staffrequests.php");
                }
            }
        ?>
    </body>
</html>