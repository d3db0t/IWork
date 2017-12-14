<html>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/register.css">

	<body>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">IWork</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
                <li class="nav-item">
					<a class="nav-link" href="index.php">Home</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href="register.php">Register <span class="sr-only">(current)</span></a>
				</li>
                <li class="nav-item">
					<a class="nav-link" href="login.php">Login</a>
				</li>
				</ul>
				<!--<form class="form-inline my-2 my-lg-0" action="index.php" method="POST" >
				<input class="form-control mr-sm-2" placeholder="Search" type="text" name="searchbar">
				<select id="dropdownmenu" name="dropdownmenu">                      
					<option value="0">--Search By--</option>
					<option value="1">name</option>
					<option value="2">address</option>
					<option value="3">type</option>
				</select>
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>-->
			</div>
		</nav>

        <form role='form' class='form-signin' action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <div class="form-group">
                    <p class='formtitles' >Username</p>
                    <input id="name" class="form-control" type="text" name="username" placeholder="username">
                </div>
                <div class="form-group">
                    <p class='formtitles' >Password</p>
                    <input class="form-control" type="password" name="password" placeholder="password">
                </div>
                <div class="form-group">
                    <p class='formtitles' >Email</p>
                    <input class="form-control" type="email" name="email" placeholder="email">
                </div>
                <div class="form-group">
                    <p class='formtitles' >Firstname</p>
                    <input id="firstname" class="form-control" type="text" name="firstname" placeholder="firstname">
                </div>               
                <div class="form-group">
                    <p class='formtitles' >Middlename</p>
                    <input id="middlename" class="form-control" type="text" name="middlename" placeholder="middlename">
                </div>  
                <div class="form-group">
                    <p class='formtitles' >Lastname</p>
                    <input id="lastname" class="form-control" type="text" name="lastname" placeholder="lastname">
                </div>
                <div class="form-group">
                    <p class='formtitles' >Experience Years</p>
                    <input id="lastname" class="form-control" type="number" name="experience" placeholder="experience years">
                </div>
                <select id="birthmonth" name="birthmonth">
                    <option value="-">birthmonth</option>
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
                <select id="birthday" name="birthday">
                    <option value="-">birthday</option>
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
                <select id="birthyear" name="birthyear">
                    <option value="-">birthyear</option>
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
                <button id='registerbtn' class="btn" type="submit" name='signup' >SignUp</button>
		</form>
    </body>

    <?php
        include('dbconfig.php');
        include('functions.php');
        if(!$conn)
          displayDBError();
        
        if($_SERVER["REQUEST_METHOD"] == "POST")
        {
            $attributes = array("username"   => $_POST["username"], 
                                "password"   => $_POST["password"],
                                "experience" => $_POST["experience"],
                                "email"      => $_POST["email"],
                                "firstname"  => $_POST["firstname"],
                                "middlename" => $_POST["middlename"],
                                "lastname"   => $_POST["lastname"],
                                "birthday"   => $_POST["birthday"],
                                "birthmonth" => $_POST["birthmonth"],
                                "birthyear"  => $_POST["birthyear"]
                        );
            if(noEmptyFields($attributes) && uniqueUsername($attributes["username"], $conn) && uniqueEmail($attributes["email"], $conn))
            {
                $birthdate = $attributes["birthmonth"] . "/" . $attributes["birthday"] . "/" . $attributes["birthyear"];
                unset($attributes["birthday"]);
                unset($attributes["birthmonth"]);
                unset($attributes["birthyear"]);
                $query = "EXEC REGISTER '".implode("' , '", $attributes)."', '$birthdate'";
                $result = sqlsrv_query($conn, $query);
                dieIfFalse
                (
                    $result, 
                    "<div class='alert alert-dismissible alert-danger'>
                    <button type='button' class='close' data-dismiss='alert'>&times;</button>
                    <strong>Oh snap!</strong> There was an error while signing up! </div>"
                );
                
                $rows_affected = sqlsrv_rows_affected($result);            
                if($rows_affected > 0)
                {
                    //redirectUserByRole($attributes["username"], $conn);
                    echo "<div class='alert alert-dismissible alert-success'>
                    <button type='button' class='close' data-dismiss='alert'>&times;</button>
                    <strong>Well done!</strong><a href='login.php' class='alert-link'>Sign in here</a></div>";
                }
                else
                {
                    die
                    (
                        "<div class='alert alert-dismissible alert-danger'>
                        <button type='button' class='close' data-dismiss='alert'>&times;</button>
                        <strong>Oh snap!</strong> There was an error while signing up! </div>"
                    ); 
                }
                
                sqlsrv_free_stmt($result);
                sqlsrv_close( $conn );
            }
        } 
        
       
    ?>
</html>