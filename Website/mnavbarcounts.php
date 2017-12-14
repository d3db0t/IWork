<?php
    include('dbconfig.php');
    $manager            = $_SESSION['username'];
    // StaffRequests navbar attribute
    $staffrequestsnav   = "EXEC ViewEmployeesRequests '$manager'";
    $params             = array();
    $options            = array( "Scrollable" => 'buffered' );
    $getStaffRequests   = sqlsrv_query($conn, $staffrequestsnav, $params, $options);
    $staffRequestsCount = sqlsrv_num_rows( $getStaffRequests );
    // JobApplications navbar attribute
    $jobApplicationsnav   = "EXEC ManagerViewJobApplications '$manager'";
    $params               = array();
    $options              = array( "Scrollable" => 'buffered' );
    $getJobApplications   = sqlsrv_query($conn, $jobApplicationsnav, $params, $options);
    $jobApplicationsCount = sqlsrv_num_rows( $getJobApplications );
?>