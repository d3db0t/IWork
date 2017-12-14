<?php
	session_start();
	include('mnavbarcounts.php');
?>
<html>
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mprofile.css">

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
				<li class="nav-item">
				<a class="nav-link" href="staffrequests.php">StaffRequests<span class="badge badge-success badge-pill" style='background-color: #34B3A0;color: white'><?php echo $staffRequestsCount ?></span></a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="jobapplications.php">JobApplications<span class="sr-only">(current)</span><span class="badge badge-success badge-pill" style='background-color: #34B3A0;color: white'><?php echo $jobApplicationsCount ?></span></a>
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
            ManagerViewJobApplications($manager, $conn);
            $depcode = '#' . $_GET['depcode'];
            if (isset($_GET['decision']) and $_GET['decision'] === 'accepted')
            {
                if (isset($_GET['jsusername']) and isset($_GET['title']) and isset($_GET['companyname']) and isset($_GET['companyaddress']) and isset($_GET['depcode']))
                {
                    ManagerAcceptJobApplication($manager, $_GET['jsusername'], $_GET['title'], $_GET['companyname'], $_GET['companyaddress'], $depcode, $_GET['response'], $conn);
                    //header("Location: jobapplications.php");
                }
            }
            else if (isset($_GET['decision']) and $_GET['decision'] === 'reject')
            {
                if (isset($_GET['jsusername']) and isset($_GET['title']) and isset($_GET['companyname']) and isset($_GET['companyaddress']) and isset($_GET['depcode']))
                {
                    ManagerRejectJobApplication($manager, $_GET['jsusername'], $_GET['title'], $_GET['companyname'], $_GET['companyaddress'], $depcode, $conn);
                    //header("Location: jobapplications.php");
                }
            }
        ?>
    </body>
</html>