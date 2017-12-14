<?php 
    session_start();
	include('mnavbarcounts.php');
?>
<html>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/assignemployee.css">

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
                <li class="nav-item active">
                    <a class="nav-link" href="assignemployeetotask.php">AssignEmployeeToTask <span class="sr-only">(current)</span></a>
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
                    <p class='formtitles' >Task Name</p>
                    <input id="taskname" class="form-control" type="text" name="taskname" placeholder="task name">
                </div>

                <div class="form-group">
                    <p class='formtitles' >Employee Username</p>
                    <input id="name" class="form-control" type="text" name="employeeusername" placeholder="employee username">
                </div>

                <button id='assignbtn' class="btn" type="submit" name='assignproject' >Assign</button>
		</form>

        <?php
            include('functions.php');
            $manager = $_SESSION['username'];
            if($_SERVER["REQUEST_METHOD"] == "POST")
            {
                $taskname         = $_POST['taskname'];
                $employeeusername = $_POST['employeeusername'];
                $q                = "EXEC AssignEmployeeToTask '$manager', '$employeeusername', '$taskname'";
                $getResults       = sqlsrv_query($conn, $q);
                if (isset($getResults))
                {
                    echo "<div class='alert alert-dismissible alert-success'>
                    <button type='button' class='close' data-dismiss='alert'>&times;</button>
                    <strong> Success!</strong> Employee assigned!</div>";
                }
                else
                {
                    echo "<div class='alert alert-dismissible alert-danger'>
                    <button type='button' class='close' data-dismiss='alert'>&times;</button>
                    <strong>Oh snap!</strong> could not assign employee! </div>";
                }
            }
        ?>
    </body>
</html>