
<?php 
if(isset($_POST['view1'])){
    $username = $_SESSION['username'];
    echo"    <tr>
    <th>name</th>
    <th>start_date</th>
    <th>end_date</th> 
    <th>manager_creator</th>

            </tr>
";

    $query1     = "EXEC ShowProjects '$username' ";
    $result1    = sqlsrv_query($conn , $query1);
 while($view = sqlsrv_fetch_array($result1)){
    $start_date1 =$view['start_date']->format('Y-m-d H:i:s');
    $end_date1   =$view['end_date']->format('Y-m-d H:i:s');

    echo '<tr class="table-dark">';
    
            echo '<td>'.$view['name'].'</td>';
            echo '<td>'.$start_date1.'</td>';
            echo '<td>'.$end_date1.'</td>';
            echo '<td>'.$view['manager_creator'].'</td>';
    
        echo '</tr>';
 }
}
?>

<?php 
if(isset($_POST['view2'])){
    $username       = $_SESSION['username'];
    $project_name   =$_POST['projectname'];

    echo"<tr>
    <th>project_name</th>
    <th>deadline</th>
    <th>description</th>
    <th>status</th>
    <th>start_date</th>
    <th>end_date</th> 
    <th>manager_creator</th>
    

        </tr>
";

    $query2     = "EXEC showTasks '$project_name', '$username' ";
    $result2    = sqlsrv_query($conn , $query2);

    while($view2 = sqlsrv_fetch_array($result2)){

        $deadline   =$view2['deadline']->format('Y-m-d H:i:s');
        $start_date =$view2['start_date']->format('Y-m-d H:i:s');
        $end_date   =$view2['end_date']->format('Y-m-d H:i:s');
        echo '<tr class="table-dark">';

                echo '<td>'.$view2['project_name'].'</td>';
                echo '<td>'.$deadline.'</td>';
                echo '<td>'.$view2['description'].'</td>';
                echo '<td>'.$view2['status'].'</td>';
                echo '<td>'.$start_date.'</td>';
                echo '<td>'.$end_date.'</td>';
                echo '<td>'.$view2['manager_creator'].'</td>';
        
    echo '</tr>';

    }
}


?>