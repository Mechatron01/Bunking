<?php
include('connection.php');

if (isset($_POST['submit'])) {
    $orderid = $_POST['orderid'];
    $uname = $_POST['uname'];
    $phone = $_POST['phone'];
    $total = $_POST['total'];
    $date = $_POST['date'];
    $time = $_POST['time'];

    $sql = "UPDATE orders SET uname='$uname', phone='$phone', total='$total', date='$date', time='$time' WHERE orderid='$orderid'";

    if (mysqli_query($conn, $sql)) {
        header('Location: orders.php');
    } else {
        echo "Error updating record: " . mysqli_error($conn);
    }
} else {
    $orderid = $_GET['orderid'];

    $sql = "SELECT * FROM orders WHERE orderid='$orderid'";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
       print_r($row);
    } else {
        echo "No results found.";
    }
}

mysqli_close($conn);
?>


<!DOCTYPE html>
<html lang="en-MU">

<head>
    <title>Edit Order</title>
</head>

<body>
    <h1>Edit Order #<?php echo $orderid;?></h1>

    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        
        <label for="uname">User Name:</label>
        <input type="text" id="uname" name="uname" value="<?php echo $row['uname']; ?>"><br><br>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="<?php echo $row['phone']; ?>"><br><br>

        <label for="total">Total:</label>
        <input type="text" id="total" name="total" value="<?php echo $row['total']; ?>"><br><br>

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" value="<?php echo $row['date']; ?>"><br><br>

        <label for="time">Time:</label>
        <input type="time" id="time" name="time" value="<?php echo $row['time']; ?>"><br><br>

        <input type="submit" name="submit" value="Update">
    </form>

</body>

</html>