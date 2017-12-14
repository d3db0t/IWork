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
				<li class="nav-item active">
					<a class="nav-link" href="mprofile.php">Profile <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
				<a class="nav-link" href="staffrequests.php">StaffRequests<span class="badge badge-success badge-pill" style='background-color: #34B3A0;color: white'><?php echo $staffRequestsCount ?></span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="jobapplications.php">JobApplications<span class="badge badge-success badge-pill" style='background-color: #34B3A0;color: white'><?php echo $jobApplicationsCount ?></span></a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="createproject.php">CreateProject</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="assignemployee.php">AssignEmployee</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="removeemployee.php">RemoveEmployee</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="createtask.php">CreateTask</a>
				</li>
				<li class="nav-item">
                    <a class="nav-link" href="assignemployeetotask.php">AssignEmployeeToTask</a>
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
            viewUserProfile($manager, $conn);
        ?>
    </body>
</html>