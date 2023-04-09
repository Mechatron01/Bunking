<?php
include "./connection.php";

include "./AdditionalPHP/startSession.php"

?>
<!DOCTYPE html>
<html lang="en-MU">

<head>
    <style>
        .edit-icon {

            background-image: url('./Assets/icons/edit-icon.png');
            background-size: 18px 18px;
            background-repeat: no-repeat;
            background-position: center;
            padding-left: 24px;
        }

        .delete-ic {
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url("https://cdn-icons-png.flaticon.com/512/1214/1214428.png");
            background-size: contain;
            background-repeat: no-repeat;
            cursor: pointer;
        }

        .add-product {
            background-color: white;
            border: none;
            color: black;
            border: 1px black solid;
            padding: 15px;
            text-align: center;
            text-decoration: none;
            /* display: inline-block; */
            font-size: 16px;
            margin:10px;
            cursor: pointer;
            float: right;
        }

        .add-product:hover{
            background-color: #4CAF50;
            transition: 0.2s;
        }


        .button-filters {
            background-color: white;
            border: 1px black solid;
            
            color: black;
            padding: 15px ;
            text-align: center;
            text-decoration: none;
            /* display: inline-block; */
            font-size: 16px;
            margin: 10px;
            cursor: pointer;
            /* float: right; */
        }
        
        .button-filters:hover{
            background-color: #4CAF50;
            color: black;
            transition: 0.2s;

        }

        .add-product:hover {
            background-color: #3e8e41;
        }
        /* Search bar and button start */
        .search-form {
        display: flex;
        justify-content: center;
        margin: 20px 0;
    }

    .search-input {
        width: 25%;
        /* padding: 0px; */
        border: 1px solid #ccc;
        border-radius: 4px;
        /* margin-right: 10px; */
        font-size: 16px;
    }

    .search-button {
        padding: 10px;
        background-color: #4CAF50;
        
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        width: 20px;
       
    }

    .search-button:hover {
        background-color: #3e8e41;
    }
        /* search bar and button end */
    </style>
</head>

<body>
    <!--
<a href="addProducts.php"><button>Add New Product</button></a> 
 Add this line -->
    <div style="text-align:center;">
        <button class="add-product" onclick="location.href='addNewProduct.php';">Add New Product</button>

        <!-- SEARCH BY PRODUCT NAME FILTER START -->
        <form  class="search-form"  method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <input type="text" name="search_term" placeholder="Search product name" class="display:inline;">
            <input type="submit" name="search" value="Search" class="button-filters">
            <input type="submit" name="allproducts" value="ALL Products" class="button-filters">
        </form>
        <!-- SEARCH BY PRODUCT NAME FILTER END -->




    </div>
    <table>
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Product Image</th>
            <th>Product Price</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <?php
        include('connection.php');

        if (!isset($_POST['allproducts']) &&  !isset($_POST['search'])) {
            // $search_term = $_POST['allproducts'];
        
            // If search form is not submitted, show all products
            $sql = "SELECT * FROM products";
        }


        // search if-else start
        if (isset($_POST['search'])) {
            $search_term = $_POST['search_term'];
        
            // Build SQL query to search for product names that match the search term
            $sql = "SELECT * FROM products WHERE p_name LIKE '%" . $search_term . "%' ";
        
        }  
        if (isset($_POST['allproducts'])) {
            $search_term = $_POST['allproducts'];
        
            // If search form is not submitted, show all products
            $sql = "SELECT * FROM products";
        }
        // search if-else end





        // $sql = "SELECT * from products";
        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {

            // Output data of each row
            while ($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . $row["productID"] . "</td>";
                echo "<td>" . $row["p_name"] . "</td>";
                echo "<td><img src='./" . $row["p_img"] . "' width='200' height='150'></td>";
                echo "<td>$" . number_format($row["p_price"], 2) . "</td>";
                echo '<td><a class="edit-icon"  href="editProducts.php?productID=' . $row["productID"] . '"></a></td>';
                echo "<td><div class='delete-ic' data-productid='" . $row["productID"] . "'></div></td>";
                echo "</tr>";
            }
        } else {
            echo "No Products found";
        }

        ?>
    </table>
    <script>
        src = "https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        $(document).ready(function() {
            $(".delete-ic").click(function() {
                var productID = $(this).data("productid");
                var productName = $(this).closest('tr').find('td:nth-child(2)').text();
                console.log(productID);
                if (confirm("Are you sure you want to delete '" + productName + "' ?")) {
                    $.ajax({
                        type: "POST",
                        url: "deleteProducts.php",
                        data: {
                            productID: productID
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