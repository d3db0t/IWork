<?php
    include('dbconfig.php');
    $manager            = $_SESSION['username'];
    $staffrequestsnav   = "EXEC ViewEmployeesRequests '$manager'";
    $params             = array();
    $options            = array( "Scrollable" => SQLSRV_CURSOR_KEYSET );
    $getStaffRequests   = sqlsrv_query($conn, $staffrequestsnav, $params, $options);
    $staffRequestsCount = sqlsrv_num_rows( $getStaffRequests );
?>