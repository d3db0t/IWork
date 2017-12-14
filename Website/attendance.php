<?php session_start() ?>
<html>
<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/index.css">

	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">IWork</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="sportalhome.php">Portal Home<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="requests.php">Requests</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="attendance.php">Attendance</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="emails.php">Emails</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="logout.php" style='color: #34B3A0'><button type="button" class="btn btn-outline-primary">Logout</button></a>
                    </li>
                </ul>
			</div>
		</nav>

        <div>
            <form class="form-inline my-2 my-lg-0" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" id='f1'>
                <button type="submit" class="btn btn-primary btn-lg btn-block" name="checkin">Check In</button>
            </form>
        </div>

        <div>
            <form class="form-inline my-2 my-lg-0" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" id='f1'>
                <button type="submit" class="btn btn-primary btn-lg btn-block" name="checkout">Check Out</button>
            </form>
        </div>
        
        <div id='j1' class="jumbotron">
				<h3>View Attendance Records</h3>
				<form class="form-inline my-2 my-lg-0" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" id='f1'>
                <select id="startmonth" name="startmonth">
                    <option value="-">startmonth</option>
                    <option value="1">January</option>
                    <option value="2">Febuary</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                <select id="startday" name="startday">
                    <option value="-">startday</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>
                </select>
                <select id="startyear" name="startyear">
                    <option value="-">startyear</option>
                    <option value="2020">2020</option>
                    <option value="2019">2019</option>
                    <option value="2018">2018</option>
                    <option value="2017">2017</option>
                    <option value="2016">2016</option>
                    <option value="2015">2015</option>
                    <option value="2014">2014</option>
                    <option value="2013">2013</option>
                    <option value="2012">2012</option>
                    <option value="2011">2011</option>
                    <option value="2010">2010</option>
                    <option value="2009">2009</option>
                    <option value="2008">2008</option>
                    <option value="2007">2007</option>
                    <option value="2006">2006</option>
                    <option value="2005">2005</option>
                    <option value="2004">2004</option>
                    <option value="2003">2003</option>
                    <option value="2002">2002</option>
                    <option value="2001">2001</option>
                    <option value="2000">2000</option>
                    <option value="1999">1999</option>
                    <option value="1998">1998</option>
                    <option value="1997">1997</option>
                    <option value="1996">1996</option>
                    <option value="1995">1995</option>
                    <option value="1994">1994</option>
                    <option value="1993">1993</option>
                    <option value="1992">1992</option>
                    <option value="1991">1991</option>
                    <option value="1990">1990</option>
                    <option value="1989">1989</option>
                    <option value="1988">1988</option>
                    <option value="1987">1987</option>
                    <option value="1986">1986</option>
                    <option value="1985">1985</option>
                    <option value="1984">1984</option>
                    <option value="1983">1983</option>
                    <option value="1982">1982</option>
                    <option value="1981">1981</option>
                    <option value="1980">1980</option>
                    <option value="1979">1979</option>
                    <option value="1978">1978</option>
                    <option value="1977">1977</option>
                    <option value="1976">1976</option>
                    <option value="1975">1975</option>
                    <option value="1974">1974</option>
                    <option value="1973">1973</option>
                    <option value="1972">1972</option>
                    <option value="1971">1971</option>
                    <option value="1970">1970</option>
                    <option value="1969">1969</option>
                    <option value="1968">1968</option>
                    <option value="1967">1967</option>
                    <option value="1966">1966</option>
                    <option value="1965">1965</option>
                    <option value="1964">1964</option>
                    <option value="1963">1963</option>
                    <option value="1962">1962</option>
                    <option value="1961">1961</option>
                    <option value="1960">1960</option>
                    <option value="1959">1959</option>
                </select>
                <select id="endmonth" name="endmonth">
                    <option value="-">startmonth</option>
                    <option value="1">January</option>
                    <option value="2">Febuary</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                <select id="endday" name="endday">
                    <option value="-">endday</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>
                </select>
                <select id="endyear" name="endyear">
                    <option value="-">endyear</option>
                    <option value="2020">2020</option>
                    <option value="2019">2019</option>
                    <option value="2018">2018</option>
                    <option value="2017">2017</option>
                    <option value="2016">2016</option>
                    <option value="2015">2015</option>
                    <option value="2014">2014</option>
                    <option value="2013">2013</option>
                    <option value="2012">2012</option>
                    <option value="2011">2011</option>
                    <option value="2010">2010</option>
                    <option value="2009">2009</option>
                    <option value="2008">2008</option>
                    <option value="2007">2007</option>
                    <option value="2006">2006</option>
                    <option value="2005">2005</option>
                    <option value="2004">2004</option>
                    <option value="2003">2003</option>
                    <option value="2002">2002</option>
                    <option value="2001">2001</option>
                    <option value="2000">2000</option>
                    <option value="1999">1999</option>
                    <option value="1998">1998</option>
                    <option value="1997">1997</option>
                    <option value="1996">1996</option>
                    <option value="1995">1995</option>
                    <option value="1994">1994</option>
                    <option value="1993">1993</option>
                    <option value="1992">1992</option>
                    <option value="1991">1991</option>
                    <option value="1990">1990</option>
                    <option value="1989">1989</option>
                    <option value="1988">1988</option>
                    <option value="1987">1987</option>
                    <option value="1986">1986</option>
                    <option value="1985">1985</option>
                    <option value="1984">1984</option>
                    <option value="1983">1983</option>
                    <option value="1982">1982</option>
                    <option value="1981">1981</option>
                    <option value="1980">1980</option>
                    <option value="1979">1979</option>
                    <option value="1978">1978</option>
                    <option value="1977">1977</option>
                    <option value="1976">1976</option>
                    <option value="1975">1975</option>
                    <option value="1974">1974</option>
                    <option value="1973">1973</option>
                    <option value="1972">1972</option>
                    <option value="1971">1971</option>
                    <option value="1970">1970</option>
                    <option value="1969">1969</option>
                    <option value="1968">1968</option>
                    <option value="1967">1967</option>
                    <option value="1966">1966</option>
                    <option value="1965">1965</option>
                    <option value="1964">1964</option>
                    <option value="1963">1963</option>
                    <option value="1962">1962</option>
                    <option value="1961">1961</option>
                    <option value="1960">1960</option>
                    <option value="1959">1959</option>
                </select>
				<button class='searchbtn' type='submit' name="viewrecords">View</button>
				</form>
			</div>
    </body>

    <?php
        include('dbconfig.php');
        include('functions.php');
        if(!$conn) displayDBError();

        if($_SERVER["REQUEST_METHOD"] == "POST")
        {
            $username = $_SESSION["username"];
            if(isset($_POST["checkin"]))
            {
                $query = "EXEC CheckIn '$username'";
                $getResults = sqlsrv_query($conn, $query);
                if(!$getResults)
                    echo "<div class='alert alert-dismissible alert-warning'>
                         <button type='button' class='close' data-dismiss='alert'>&times;</button>
                         <h4 class='alert-heading'>Warning!</h4>
                         <p class='mb-0'>You have already checked in</p>
                         </div>";
                else 
                {
                    $rowsAffected = sqlsrv_rows_affected($getResults);     
                    if($rowsAffected > 0)               
                         echo "<div class='alert alert-dismissible alert-success'>
                             <button type='button' class='close' data-dismiss='alert'>&times;</button>
                             <strong>Well done!</strong> You successfully Checked in
                             </div>";
                    else
                        echo "<div class='alert alert-dismissible alert-warning'>
                             <button type='button' class='close' data-dismiss='alert'>&times;</button>
                             <h4 class='alert-heading'>Warning!</h4>
                             <p class='mb-0'>You cannot check in on day off</p>
                             </div>";            
                }       
            }
            else if(isset($_POST["checkout"]))
            {
                $checkedOut = "SELECT * FROM Attendance WHERE username = '$username' AND date = DATEADD(DD,0,DATEDIFF(DD,0,CURRENT_TIMESTAMP)) AND end_time IS NOT NULL";
                $result = sqlsrv_query($conn, $checkedOut);
                if(sqlsrv_has_rows($result))
                    echo "<div class='alert alert-dismissible alert-warning'>
                         <button type='button' class='close' data-dismiss='alert'>&times;</button>
                         <h4 class='alert-heading'>Warning!</h4>
                         <p class='mb-0'>You have already checked out</p>
                         </div>";
                else
                {
                    $query = "EXEC CheckOut '$username'";
                    $getResults = sqlsrv_query($conn, $query);
                    $rowsAffected = sqlsrv_rows_affected($getResults);
                    if($rowsAffected > 0)
                        echo "<div class='alert alert-dismissible alert-success'>
                            <button type='button' class='close' data-dismiss='alert'>&times;</button>
                            <strong>Well done!</strong> You successfully Checked out
                            </div>";
                    else
                        echo "<div class='alert alert-dismissible alert-warning'>
                            <button type='button' class='close' data-dismiss='alert'>&times;</button>
                            <h4 class='alert-heading'>Warning!</h4>
                            <p class='mb-0'>You must check in first</p>
                            </div>";
                }
            }
            else if(isset($_POST["viewrecords"]))
            {
                $startdate = false;
                if($_POST["startmonth"] != "-" && $_POST["startday"] != "-" && $_POST["startyear"] != "-")
                    $startdate = $_POST["startmonth"] . "/" . $_POST["startday"] . "/" . $_POST["startyear"];
                
                $enddate = false;
                if($_POST["endmonth"] != "-" && $_POST["endday"] != "-" && $_POST["endyear"] != "-")
                    $enddate = $_POST["endmonth"] . "/" . $_POST["endday"] . "/" . $_POST["endyear"];
                    
                if(!$startdate || !$enddate)
                    die("<div class='alert alert-dismissible alert-warning'>
                    <button type='button' class='close' data-dismiss='alert'>&times;</button>
                    <h4 class='alert-heading'>Warning!</h4>
                    <p class='mb-0'>Please fill in all fields</p>
                    </div>");
                
                /*$startdate = date_create($startdate);
                $enddate = date_create($enddate);
                if($enddate < $startdate)
                    die("<div class='alert alert-dismissible alert-warning'>
                    <button type='button' class='close' data-dismiss='alert'>&times;</button>
                    <h4 class='alert-heading'>Warning!</h4>
                    <p class='mb-0'>End date must be after start date</p>
                    </div>");
                */

                $query = "EXEC ViewAttendanceRecords '$username', '$startdate', '$enddate'";
                $getResults = sqlsrv_query($conn, $query);
                dieIfFalse($getResults, "<div class='alert alert-dismissible alert-warning'>
                <button type='button' class='close' data-dismiss='alert'>&times;</button>
                <h4 class='alert-heading'>Warning!</h4>
                <p class='mb-0'>No Records found or dates entered wrong</p>
                </div>");
                dieIfNoRows($getResults, "<div class='alert alert-dismissible alert-warning'>
                <button type='button' class='close' data-dismiss='alert'>&times;</button>
                <h4 class='alert-heading'>Warning!</h4>
                <p class='mb-0'>No Records found or dates entered wrong</p>
                </div>");

                echo "<table class='table table-striped table-hover table-bordered'>
                    <thead class='thead-dark'>
                    <tr>
                    <th>Date</th>
                    <th>Start-Time</th>
                    <th>End-Time</th>
                    <th>Duration</th>
                    <th>Missing Hours</th>
                    </tr>
                    </thead>
                    <tbody>";
                while($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC))
                {
                    $date = $row["date"]->format('Y-m-d');
                    $starttime = $row["start_time"]->format('H:i:s');
                    $endtime = $row["end_time"]->format('H:i:s');
                    $duration = $row["duration"];
                    $missingHours = $row["missing_hours"];
                    echo"<tr>
                        <td>$date</td>
                        <td>$starttime</td>
                        <td>$endtime</td>
                        <td>$duration</td>
                        <td>$missingHours</td>
                        </tr>";
                }

                echo "</tbody></table> ";

            }
        }
    ?>
</html>