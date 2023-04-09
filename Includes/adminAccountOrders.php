<?php
include "./connection.php";
include "./AdditionalPHP/startSession.php"

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
        .delete-icn {
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
    <table>
        <tr>

            <th>OrderId</th>
            <th>User name</th>
            <th>Phone</th>
            <th>Total amount</th>
            <th>Date</th>
            <th>Time</th>
            <th>Delete</th>
        </tr>

        <?php
        include('connection.php');

        $sql = "SELECT DISTINCT o.orderid,u.uname,o.phone,o.total,o.date,o.time 
        from userorder o, user u where o.userID=u.userID ORDER BY o.orderid DESC ";

        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {

            // Output data of each row
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo '<td><a href="orderDetails.php?orderid=' . $row["orderid"] . '">' . $row["orderid"] . '</a></td>';
                echo "<td>" . $row["uname"] . "</td>";
                echo "<td>" . $row["phone"] . "</td>";
                echo "<td>$" . number_format($row["total"], 2) . "</td>";
                echo "<td>" . $row["date"] . "</td>";
                echo "<td>" . $row["time"] . "</td>";
                echo "<td><div class='delete-icn' data-orderid='" . $row["orderid"] . "'></div></td>";
                echo "</tr>";
            } 
        } else {
            echo "No orders found";
        }

        ?>

    </table>
    <script>
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"  
        $(document).ready(function() {
            $(".delete-icn").click(function() {
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

