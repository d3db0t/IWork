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
                <li class="nav-item">
                    <a class="nav-link" href="assignemployeetotask.php">AssignEmployeeToTask</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="changeassignedemployee.php">ChangeAssignedEmployee</a>
                </li>
                <li class="nav-item active">
					<a class="nav-link" href="viewtasks.php">ViewTasks<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="sportalhome.php">StaffPortal</a>
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
                    <p class='formtitles' >Project Name</p>
                    <input id="projectname" class="form-control" type="text" name="projectname" placeholder="project name">
                </div>

                <div class="form-group">
                    <p class='formtitles' >Status</p>
                    <input id="status" class="form-control" type="text" name="status" placeholder="status">
                </div>

                <button id='assignbtn' class="btn" type="submit" name='assignproject' >Search</button>
		</form>

        <?php
            include('functions.php');
            $manager = $_SESSION['username'];
            if($_SERVER["REQUEST_METHOD"] == "POST")
            {
                $projectname   = $_POST['projectname'];
                $status        = $_POST['status'];
                $q             = "EXEC ProjectTasks '$manager', '$projectname', '$status'";
                $getResults    = sqlsrv_query($conn, $q);
                ViewTasks($manager, $projectname, $status, $conn);
                
            }
            $taskname      = $_GET['taskname'];
            $deadline      = $_GET['deadline'];
            if (isset($_GET['decision']) and $_GET['decision'] === 'accept')
            {
                if (isset($_GET['taskname']))
                {
                    $q2 = "EXEC CloseTask '$manager', '$taskname'";
                    $q2results = sqlsrv_query($conn, $q2);
                    $rows_affected = sqlsrv_rows_affected($q2results);
                    if ($rows_affected > 0)
                    {
                        echo "<div class='alert alert-dismissible alert-success'>
                        <button type='button' class='close' data-dismiss='alert'>&times;</button>
                        <strong> Success!</strong> Task accepted!</div>";
                    }
                    else
                    {
                        echo "<div class='alert alert-dismissible alert-danger'>
                        <button type='button' class='close' data-dismiss='alert'>&times;</button>
                        <strong>Oh snap!</strong> could not review task! </div>";
                    }
                }
            }
            else if (isset($_GET['decision']) and $_GET['decision'] === 'reject')
            {
                if (isset($_GET['taskname']) and isset($_GET['deadline']))
                {
                    $q2 = "EXEC AssignTask '$manager', '$taskname', '$deadline'";
                    $q2results = sqlsrv_query($conn, $q2);
                    $rows_affected = sqlsrv_rows_affected($q2results);
                    if ($rows_affected > 0)
                    {
                        echo "<div class='alert alert-dismissible alert-success'>
                        <button type='button' class='close' data-dismiss='alert'>&times;</button>
                        <strong> Success!</strong> Task rejected!</div>";
                    }
                    else
                    {
                        echo "<div class='alert alert-dismissible alert-danger'>
                        <button type='button' class='close' data-dismiss='alert'>&times;</button>
                        <strong>Oh snap!</strong> could not review task! </div>";
                    }
                }
            }
            else
            {
                echo "<p>No tasks are found!</p>";
            }
        ?>
    </body>
</html>