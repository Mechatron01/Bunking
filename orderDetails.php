<?php
include "./connection.php";
include "./AdditionalPHP/startSession.php";

// Retrieve the order ID from the query parameter
if (isset($_GET['orderid'])) {
    $orderid = $_GET['orderid'];
} else {
    // If the order ID is not provided, redirect to the orders page
    header('Location: orders.php');
    exit();
}

// Retrieve the details of the selected order from the database
include('connection.php');
$sql = "SELECT distinct o.orderid, u.uname, o.phone, o.total, o.date, o.time 
        FROM userorder o
        JOIN user u ON o.userID = u.userID
        WHERE o.orderid = ?";

$sql2= "SELECT p.p_name,oi.quantity,round(p.p_price*oi.quantity,2) 'p.p_price'
        from products p,
	    orderitem oi
        where p.productID=oi.productID
        and oi.orderID=?";

$stmt = mysqli_prepare($conn, $sql);
$stmt2 = mysqli_prepare($conn,$sql2);
mysqli_stmt_bind_param($stmt, "i", $orderid);
mysqli_stmt_bind_param($stmt2, "i", $orderid);

mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

mysqli_stmt_execute($stmt2);
$result2 = mysqli_stmt_get_result($stmt2);




if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $row2 = mysqli_fetch_all($result2, MYSQLI_ASSOC);//mysqli_fetch_assoc($result2);

} else {
    // If the order is not found, display an error message
    echo "Order not found";
    exit();
}
?>

<!DOCTYPE html>
<html lang="en-MU">
<head>
    <title>Order Details</title>
 
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f2f2f2;
        }
        h1 {
            text-align: center;
            margin-top: 50px;
        }
        table {
            border-collapse: collapse;
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
        }
        th, td {
            text-align: left;
            padding: 12px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #FF7380FF;
            color: white;
            width: 35%;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .total {
            font-weight: bold; 
            color: black;
            text-align: right;
            padding-right: 12px;
        }
    </style>
</head>
<body>
    <h1>Order Details</h1>
    <table>
        <tr>
            <th>Order ID:</th>
            <td><?php echo $row['orderid']; ?></td>
        </tr>
        <tr>
            <th>User Name:</th>
            <td><?php echo $row['uname']; ?></td>
        </tr>
        <tr>
            <th>Phone:</th>
            <td><?php echo $row['phone']; ?></td>
        </tr>
        <tr>
            <th>Total Amount:</th>
            <td><?php echo '$' . number_format($row['total'], 2); ?></td>
        </tr>
        <tr>
            <th>Date:</th>
            <td><?php echo date('F j, Y', strtotime($row['date'])); ?></td>
        </tr>
        <tr>
            <th>Time:</th>
            <td><?php echo date('g:i A', strtotime($row['time'])); ?></td>
        </tr>
    </table>


    <h1>Products</h1>
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
        </thead>
        <?php
            $total_price = 0; // Initialize the total price to 0
            foreach ($row2 as $rows) {
                echo "<tr>";
                echo "<td>" . $rows['p_name'] . "</td>";
                echo "<td>" . $rows['quantity'] . "</td>";
                echo "<td>$" . number_format($rows['p.p_price'], 2) . "</td>";
                echo "</tr>";
                $total_price += $rows['p.p_price']; // Add the item price to the total
            }
        ?>
        <tr>
           
            <td class="total" colspan="2">Total Price:</td>
            <td class="total" style="float:left; border:none;"><?php echo '$' . number_format($row['total'], 2);?></td>
        </tr>
    </table>
</body>
</html>
