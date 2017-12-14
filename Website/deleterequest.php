<?php
    session_start();
    include('dbconfig.php');
    if(!$conn)
        displayDBError();
    

    $code = $_GET["code"];
    $query = "EXEC DeleteRequests '$code'";
    $getResults = sqlsrv_query($conn, $query);
    header("Location: requests.php");    
?>