<?php 
    session_start();
	include('mnavbarcounts.php');
?>
<html>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/createproject.css">

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
                <li class="nav-item active">
                    <a class="nav-link" href="createproject.php">CreateProject <span class="sr-only">(current)</span></a>
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
                <li class="nav-item">
					<a class="nav-link" href="viewtasks.php">ViewTasks</a>
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
                    <input id="name" class="form-control" type="text" name="projectname" placeholder="project name">
                </div>
                <p class='formtitles' >Start Date</p>
                <select id='month1' name='month1'>
                    <option value='-'>month</option>
                    <option value='1'>January</option>
                    <option value='2'>Febuary</option>
                    <option value='3'>March</option>
                    <option value='4'>April</option>
                    <option value='5'>May</option>
                    <option value='6'>June</option>
                    <option value='7'>July</option>
                    <option value='8'>August</option>
                    <option value='9'>September</option>
                    <option value='10'>October</option>
                    <option value='11'>November</option>
                    <option value='12'>December</option>
                </select>
                <select id='day1' name='day1'>
                    <option value='-'>day</option>
                    <option value='1'>1</option>
                    <option value='2'>2</option>
                    <option value='3'>3</option>
                    <option value='4'>4</option>
                    <option value='5'>5</option>
                    <option value='6'>6</option>
                    <option value='7'>7</option>
                    <option value='8'>8</option>
                    <option value='9'>9</option>
                    <option value='10'>10</option>
                    <option value='11'>11</option>
                    <option value='12'>12</option>
                    <option value='13'>13</option>
                    <option value='14'>14</option>
                    <option value='15'>15</option>
                    <option value='16'>16</option>
                    <option value='17'>17</option>
                    <option value='18'>18</option>
                    <option value='19'>19</option>
                    <option value='20'>20</option>
                    <option value='21'>21</option>
                    <option value='22'>22</option>
                    <option value='23'>23</option>
                    <option value='24'>24</option>
                    <option value='25'>25</option>
                    <option value='26'>26</option>
                    <option value='27'>27</option>
                    <option value='28'>28</option>
                    <option value='29'>29</option>
                    <option value='30'>30</option>
                    <option value='31'>31</option>
                </select>
                <select id='year1' name='year1'>
                    <option value='-'>year</option>
                    <option value='2011'>2011</option>
                    <option value='2010'>2010</option>
                    <option value='2009'>2009</option>
                    <option value='2008'>2008</option>
                    <option value='2007'>2007</option>
                    <option value='2006'>2006</option>
                    <option value='2005'>2005</option>
                    <option value='2004'>2004</option>
                    <option value='2003'>2003</option>
                    <option value='2002'>2002</option>
                    <option value='2001'>2001</option>
                    <option value='2000'>2000</option>
                    <option value='1999'>1999</option>
                    <option value='1998'>1998</option>
                    <option value='1997'>1997</option>
                    <option value='1996'>1996</option>
                    <option value='1995'>1995</option>
                    <option value='1994'>1994</option>
                    <option value='1993'>1993</option>
                    <option value='1992'>1992</option>
                    <option value='1991'>1991</option>
                    <option value='1990'>1990</option>
                    <option value='1989'>1989</option>
                    <option value='1988'>1988</option>
                    <option value='1987'>1987</option>
                    <option value='1986'>1986</option>
                    <option value='1985'>1985</option>
                    <option value='1984'>1984</option>
                    <option value='1983'>1983</option>
                    <option value='1982'>1982</option>
                    <option value='1981'>1981</option>
                    <option value='1980'>1980</option>
                    <option value='1979'>1979</option>
                    <option value='1978'>1978</option>
                    <option value='1977'>1977</option>
                    <option value='1976'>1976</option>
                    <option value='1975'>1975</option>
                    <option value='1974'>1974</option>
                    <option value='1973'>1973</option>
                    <option value='1972'>1972</option>
                    <option value='1971'>1971</option>
                    <option value='1970'>1970</option>
                    <option value='1969'>1969</option>
                    <option value='1968'>1968</option>
                    <option value='1967'>1967</option>
                    <option value='1966'>1966</option>
                    <option value='1965'>1965</option>
                    <option value='1964'>1964</option>
                    <option value='1963'>1963</option>
                    <option value='1962'>1962</option>
                    <option value='1961'>1961</option>
                    <option value='1960'>1960</option>
                    <option value='1959'>1959</option>
                </select>
                <p class='formtitles' >End Date</p>
                <select id='month2' name='month2'>
                    <option value='-'>month</option>
                    <option value='1'>January</option>
                    <option value='2'>Febuary</option>
                    <option value='3'>March</option>
                    <option value='4'>April</option>
                    <option value='5'>May</option>
                    <option value='6'>June</option>
                    <option value='7'>July</option>
                    <option value='8'>August</option>
                    <option value='9'>September</option>
                    <option value='10'>October</option>
                    <option value='11'>November</option>
                    <option value='12'>December</option>
                </select>
                <select id='day2' name='day2'>
                    <option value='-'>day</option>
                    <option value='1'>1</option>
                    <option value='2'>2</option>
                    <option value='3'>3</option>
                    <option value='4'>4</option>
                    <option value='5'>5</option>
                    <option value='6'>6</option>
                    <option value='7'>7</option>
                    <option value='8'>8</option>
                    <option value='9'>9</option>
                    <option value='10'>10</option>
                    <option value='11'>11</option>
                    <option value='12'>12</option>
                    <option value='13'>13</option>
                    <option value='14'>14</option>
                    <option value='15'>15</option>
                    <option value='16'>16</option>
                    <option value='17'>17</option>
                    <option value='18'>18</option>
                    <option value='19'>19</option>
                    <option value='20'>20</option>
                    <option value='21'>21</option>
                    <option value='22'>22</option>
                    <option value='23'>23</option>
                    <option value='24'>24</option>
                    <option value='25'>25</option>
                    <option value='26'>26</option>
                    <option value='27'>27</option>
                    <option value='28'>28</option>
                    <option value='29'>29</option>
                    <option value='30'>30</option>
                    <option value='31'>31</option>
                </select>
                <select id='year2' name='year2'>
                    <option value='-'>year</option>
                    <option value='2025'>2025</option>
                    <option value='2024'>2024</option>
                    <option value='2023'>2023</option>
                    <option value='2022'>2022</option>
                    <option value='2021'>2021</option>
                    <option value='2020'>2020</option>
                    <option value='2019'>2019</option>
                    <option value='2018'>2018</option>
                    <option value='2017'>2017</option>
                    <option value='2016'>2016</option>
                    <option value='2015'>2015</option>
                    <option value='2014'>2014</option>
                    <option value='2013'>2013</option>
                    <option value='2012'>2012</option>
                    <option value='2011'>2011</option>
                    <option value='2010'>2010</option>
                    <option value='2009'>2009</option>
                    <option value='2008'>2008</option>
                    <option value='2007'>2007</option>
                    <option value='2006'>2006</option>
                    <option value='2005'>2005</option>
                    <option value='2004'>2004</option>
                    <option value='2003'>2003</option>
                    <option value='2002'>2002</option>
                    <option value='2001'>2001</option>
                    <option value='2000'>2000</option>
                    <option value='1999'>1999</option>
                    <option value='1998'>1998</option>
                    <option value='1997'>1997</option>
                    <option value='1996'>1996</option>
                    <option value='1995'>1995</option>
                    <option value='1994'>1994</option>
                    <option value='1993'>1993</option>
                    <option value='1992'>1992</option>
                    <option value='1991'>1991</option>
                    <option value='1990'>1990</option>
                    <option value='1989'>1989</option>
                    <option value='1988'>1988</option>
                    <option value='1987'>1987</option>
                    <option value='1986'>1986</option>
                    <option value='1985'>1985</option>
                    <option value='1984'>1984</option>
                    <option value='1983'>1983</option>
                    <option value='1982'>1982</option>
                    <option value='1981'>1981</option>
                    <option value='1980'>1980</option>
                    <option value='1979'>1979</option>
                    <option value='1978'>1978</option>
                    <option value='1977'>1977</option>
                    <option value='1976'>1976</option>
                    <option value='1975'>1975</option>
                    <option value='1974'>1974</option>
                    <option value='1973'>1973</option>
                    <option value='1972'>1972</option>
                    <option value='1971'>1971</option>
                    <option value='1970'>1970</option>
                    <option value='1969'>1969</option>
                    <option value='1968'>1968</option>
                    <option value='1967'>1967</option>
                    <option value='1966'>1966</option>
                    <option value='1965'>1965</option>
                    <option value='1964'>1964</option>
                    <option value='1963'>1963</option>
                    <option value='1962'>1962</option>
                    <option value='1961'>1961</option>
                    <option value='1960'>1960</option>
                    <option value='1959'>1959</option>
                </select>

                <button id='createprojectbtn' class="btn" type="submit" name='createproject' >Create</button>
		</form>

        <?php
            include('functions.php');
            if($_SERVER["REQUEST_METHOD"] == "POST")
            {
                $attributes = array("month1"   => $_POST["month1"], 
                "day1"   => $_POST["day1"],
                "year1" => $_POST["year1"],
                "month2" => $_POST["month2"],
                "day2" => $_POST["day2"],
                "year2" => $_POST["year2"]
                );
                $start_date        = $attributes["month1"] . "/" . $attributes["day1"] . "/" . $attributes["year1"];
                $end_date          = $attributes["month2"] . "/" . $attributes["day2"] . "/" . $attributes["year2"];
                $projectname       = $_POST['projectname'];
                $companynameq      = "SELECT company_name FROM Staff_Members WHERE username = '$manager'";
                $companyaddressq   = "SELECT company_address FROM Staff_Members WHERE username = '$manager'";
                $getCompanyName    = sqlsrv_query($conn, $companynameq);
                $getCompanyAddress = sqlsrv_query($conn, $companyaddressq);
                $comapnyName       = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)['company_name'];
                $companyAddress    = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)['company_address'];

                $q                 = "EXEC CreateProject '$manager', '$projectname', '$comapnyName', '$companyAddress', '$start_date', '$end_date'";
                $getResults        = sqlsrv_query($conn, $q);
                $rows_affected = sqlsrv_rows_affected($getResults);
                if ($rows_affected > 0)
                {
                    echo "<div class='alert alert-dismissible alert-success'>
                    <button type='button' class='close' data-dismiss='alert'>&times;</button>
                    <strong> Success!</strong> Project created!</div>";
                }
                else
                {
                    echo "<div class='alert alert-dismissible alert-danger'>
                    <button type='button' class='close' data-dismiss='alert'>&times;</button>
                    <strong>Oh snap!</strong> could not create the project! </div>";
                }
            }
        ?>
    </body>
</html>