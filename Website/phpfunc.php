<?php session_start() ?>
<?php 
if(isset($_POST['click'])){
    echo('<tr class="table-success">');

    echo('<th>');
        echo('Company_Name');
    echo('</th>');

    echo('<th>');
        echo('Comapny_address');
    echo('</th>');
    echo('<th>');
        echo('Status');
    echo('</th>');

    echo('<th>');
        echo('Score');
    echo('</th>');

    echo('</tr>');
$name=$_SESSION['username'];
$query="EXEC ViewAppliedJobsStatusAndScore '$name'";
$results = sqlsrv_query($conn,$query);
while($seeker = sqlsrv_fetch_array($results)){
    echo '<tr class="table-dark">';

        echo '<td>'.$seeker['company_name'].'</td>';
        echo '<td>'.$seeker['company_address'].'</td>';
        echo '<td>'.$seeker['status'].'</td>';
        echo '<td>'.$seeker['score'].'</td>';

    echo '</tr>';
}
}


?>


<?php
/*if(isset($_POST['click2'])){

    echo('<tr class="table-primary">');
    echo('<th>');
        echo('Questions');
    echo('</th>');
    echo('</tr>');
$name=$_SESSION['username'];
$jobtitle=$_POST['jobtitle'];
$companyname=$_POST['companyname'];
$companyaddress=$_POST['companyaddress'];
$depcode=$_POST['depcode'];

$query="EXEC ViewInterviewQuestions '$name', '$jobtitle', '$companyname', '$companyaddress', '$depcode'";
$results = sqlsrv_query($conn,$query);
while($seeker = sqlsrv_fetch_array($results)){
    echo '<tr class="table-dark">';

        echo '<td>'.$seeker['question'].'</td>';

    echo '</tr>';
}
}
*/

?>

<?php
if(isset($_POST['click2'])){

    $name            =$_SESSION['username'];
    $title_of_job    =$_GET['jobtitle'];
    $comp_name       =$_GET['companyname'];
    $comp_add        =$_GET['companyaddress'];
    $dep             =$_GET['dep'];
    
    $depcode = '#' . $dep;


    $query1         = "EXEC DeleteJobApplication '$name', '$title_of_job', '$comp_name', '$comp_add', '$depcode' ";
    $result1        = sqlsrv_query($conn,$query1);
    $rows_effected  = sqlsrv_rows_affected($result1);

    if($rows_effected == TRUE){
        echo('<h1>the application is deleted</h1>');
    }
    if(isset($result1)){
        echo('<h1>the deleted quey is ok</h1>');
    }
}
?>
<?php 
if(isset($_POST['click3'])){
    $name            =$_SESSION['username'];
    $title_of_job    =$_GET['jobtitle'];
    $comp_name       =$_GET['companyname'];
    $comp_add        =$_GET['companyaddress'];
    $dep             =$_GET['dep'];
    
    $depcode = '#' . $dep;

    $query3         = "EXEC UserAcceptsAnOffer '$name', '$title_of_job', '$comp_name', '$comp_add', '$depcode','Sunday' ";
    $result3        = sqlsrv_query($conn,$result3);
    $rows_effected3 = sqlsrv_rows_affected($result3);

    if(isset($result3)){
        echo('<h1>Welcome to</h1>'.'<h1>'.$comp_name.'</h1>');
    }

}


?>


