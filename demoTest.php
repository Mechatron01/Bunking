<?php
include "./AdditionalPHP/startSession.php";
include "./AdditionalPHP/connection.php";

//get orderID and userID from session
$orderID = $_SESSION['orderID'];
$userID = $_SESSION['userID'];

//get other form data
$total = $_POST['total'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$status = $_POST['status'];
$createDate = date('Y-m-d H:i:s');
$isSchedule = isset($_POST['address_check']) ? 1 : 0;
$Date = '';
$time = '';

//if user scheduled the order, get scheduled date and time
if($isSchedule) {
    $Date = $_POST['schedule-date'];
    $time = $_POST['schedule-time'];
}



//insert data into userorder table
$sql = "INSERT INTO userorder (orderID, userID, total, address, phone, status, createDate, isSchedule, Date, time)
        VALUES ('$orderID', '$userID', '$total', '$address', '$phone', '$status', '$createDate', '$isSchedule', '$Date', '$time')";

if (mysqli_query($conn, $sql)) {
    echo "Order placed successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
?>
