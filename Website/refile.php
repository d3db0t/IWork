<?php include('dbconfig.php') ?>
<?php session_start() ?>

<html>
<link rel="stylesheet" href="css/bootstrap.min.css">

<body>
<form method="POST">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">IWork</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="register.php">Register</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="login.php">Login</a>
				</li>
				</ul>
			</div>
</nav>


<p>
<select id="dropdownmenu" name="projectname">                      
        <?php 
            $name = $_SESSION['username'];
            $getproject = "SELECT project_name FROM Employees_Assigned_For_Project WHERE employee_assigned = '$name' ";
            $result3    = sqlsrv_query($conn , $getproject);
            echo('<option value="0">--Search By--</option>');
            while($getthem1 = sqlsrv_fetch_array($result3)){
               echo('<option>'.$getthem1['project_name'].'<option>');
            }
        
        ?>
</select>
</p>


<p>
<select id="dropdownmenu" name="taskshow">                      
        <?php 
            $name;
            $project_name;
            $getproject2 = "SELECT t.name FROM Tasks t INNER JOIN Projects p ON t.project_name  = p.name  where t.employee_assigned = '$name' ";
            $result4     = sqlsrv_query($conn , $getproject2);
            echo('<option value="0">--Search By--</option>');
            while($getthem2 = sqlsrv_fetch_array($result4)){
               echo('<option>'.$getthem2['name'].'<option>');
            }
        
        ?>
</select>
</p>

<?php 
if(isset($_POST['fixed2'])){

    $change_to_fixed = "EXEC DeadlineOFTask  'HanaKimo' ,'New Web Application Design' , 'New Mac Release' , 'Apple' , 'WashingtonDC' ";
    $the_result_fixed = sqlsrv_query($conn,$change_to_fixed);
    if(isset($the_result_fixed)){
        echo('fixed2 5alas');
    }else{
        echo('lesa mesh fixed2');
    }
}
?>






<button type="submit" name="view1" class="btn btn-success">VIEW PROJECTS</button>
<button type="submit" name="view2" class="btn btn-success">VIEW TASKS</button>
<button type="submit" name"fixed2"  class="btn btn-success" >ASSIGN THE TASK INTO FIXED</button>








<table class="table">
<?php include('refileFunc.php') ?>
<table>



</form>
</body>
</html>