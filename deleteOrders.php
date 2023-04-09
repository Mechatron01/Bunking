<?php

include "connection.php";

if(isset($_POST['orderid'])) {
    $orderid = $_POST['orderid'];
    
    // Delete the order from the database
    $sql = "DELETE FROM userorder WHERE orderID = $orderid";
    
    if(mysqli_query($conn, $sql)) {
        echo "Order deleted successfully";
    } else {
        echo "Error deleting order: " . mysqli_error($conn);
    }
} else {
    echo "No order ID specified";
}

mysqli_close($conn);

?>