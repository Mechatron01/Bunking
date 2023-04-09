<?php
//<!--========== PHP CONNECTION TO DATABASE ==========-->
    $host = "localhost";
    $username = "root";
    // $pass = "Bun King Bakery123";
    $pass = "";

    $dbname = "cakeshop";
    //create connection
    $conn = mysqli_connect($host, $username, $pass, $dbname);
    //check connection
    if(!$conn){
        echo "Connection failed: " . mysqli_connect_error();
    }

?>