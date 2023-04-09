<?php
//START SESSION
include "./AdditionalPHP/startSession.php";

//CONNECTION TO DATABASE : cakeshop
include_once 'connection.php';

$uname = $_SESSION['uname'];

$y = "SELECT userID FROM user WHERE uname='$uname'";
$result = mysqli_query($conn, $y);
$row = mysqli_fetch_assoc($result);
$userID = $row['userID'];


// Close connection

?>


<!DOCTYPE html>
<html lang="en-MU">

<head>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /*Switch Start */
        button {
            background-color: #ffffff;
            border-color: #007bff;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
       
        button.clicked {
            background-color: #007bff;
            color: #ffffff;
        }

        /*Switch End */
        
        .delete-icon {
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url("https://cdn-icons-png.flaticon.com/512/1214/1214428.png");
            background-size: contain;
            background-repeat: no-repeat;
            cursor: pointer;
        }


    </style>


</head>

<body>

    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
        <!-- Form fields go here -->


    </form>



    <table>
        <tr>

            <th>OrderId</th>
            <!-- <th>User name</th> -->
            <!-- <th>Phone</th> -->
            <th>Total amount</th>
            <th>Date</th>
            <th>Time</th>
            <!-- <th>Delete</th> -->

        </tr>

        <?php
        include('connection.php');

        $sql = "SELECT o.orderID, o.total, o.date, o.time 
        FROM userorder o, user u 
        WHERE o.userID=u.userID AND o.userID = {$userID} ORDER BY o.orderID DESC";
        
        // AND o.date > CURDATE()";
        

        
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {

            // Output data of each row
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo '<td><a href="orderDetails.php?orderid=' . $row["orderID"] . '">' . $row["orderID"] . '</a></td>';
                // echo "<td>" . $row["uname"] . "</td>";
                // echo "<td>" . $row["phone"] . "</td>";
                //echo "<td>" . $row["total"] . "</td>";
                echo "<td>$" . number_format($row["total"], 2) . "</td>";
                echo "<td>" . $row["date"] . "</td>";
                echo "<td>" . $row["time"] . "</td>";
                // echo "<td><div class='delete-icon' data-orderid='" . $row["orderID"] . "'></div></td>";
                echo "</tr>";
            }
        } else {
            echo "No uture orders found";
        }

        ?>

    </table>
    <script>
        $(document).ready(function() {
            $(".delete-icon").click(function() {
                var orderid = $(this).data("orderid");
                if (confirm("Are you sure you want to delete order #" + orderid + "?")) {
                    $.ajax({
                        type: "POST",
                        url: "deleteOrders.php",
                        data: {
                            orderid: orderid
                        },
                        success: function() {
                            window.location.reload();
                        }
                    });
                }
            });
        });
    </script> 

</body>


</html>

