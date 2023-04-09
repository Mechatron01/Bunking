<?php

include "connection.php";

if(isset($_POST['productID'])) {
    $productID = $_POST['productID'];
    
    // Delete the order from the database
    $sql = "DELETE FROM products WHERE productid = $productID";
    
    if(mysqli_query($conn, $sql)) {
        echo "Product deleted successfully";
    } else {
        echo "Error deleting product: " . mysqli_error($conn);
    }
} else {
    echo "No product specified";
}

mysqli_close($conn);

?>