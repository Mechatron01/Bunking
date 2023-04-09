<?php
include('connection.php');

if (isset($_POST['submit'])) {
    print_r($_POST);
    $productid = $_POST['productID'];
    $p_name = $_POST['p_name'];
    $p_img = $_POST['p_img'];
    $p_price = $_POST['p_price'];


    $sql = "UPDATE products SET p_name='$p_name', p_price='$p_price' WHERE productid='$productid'";

    if (mysqli_query($conn, $sql)) {
        header('Location: products.php');
    } else {
        echo "Error updating record: " . mysqli_error($conn);
    }
} else {
    $productID = $_GET['productID'];

    $sql = "SELECT * FROM products WHERE productid='$productID'";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
       //print_r($row);
    } else {
        echo "No results found.";
    }
}

mysqli_close($conn);
?>


<!DOCTYPE html>

<html lang="en-MU">
    <head>
        <title>Edit Product</title>
        <style>
            /* body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            h1 {
                font-size: 36px;
                margin-bottom: 20px;
            }
            form {
                width: 500px;
                margin: 0 auto;
            }
            label {
                display: block;
                margin-bottom: 10px;
            }
            input[type="text"] {
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
                border: 1px solid #ccc;
                width: 100%;
                margin-bottom: 20px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #3e8e41;
            } */
            body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
			background-color: #f2f2f2;
		}

		h1 {
			font-size: 36px;
			margin-bottom: 30px;
			color: #333;
			text-align: center;
			text-shadow: 1px 1px #ccc;
		}

		form {
			max-width: 600px;
			margin: 30px auto;
			background-color: #fff;
			padding: 30px;
			border-radius: 5px;
			box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
		}

		label {
			display: block;
			margin-bottom: 10px;
			color: #666;
			font-weight: bold;
		}

		input[type="text"] {
			padding: 10px;
			font-size: 16px;
			border-radius: 5px;
			border: 1px solid #ccc;
			width: 100%;
			margin-bottom: 20px;
			color: #333;
		}

		input[type="submit"] {
			background-color: #4CAF50;
			border: none;
			color: white;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			border-radius: 5px;
			cursor: pointer;
			transition: background-color 0.3s ease;
		}

		input[type="submit"]:hover {
			background-color: #3e8e41;
		}
        .form-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .form-button-cancel {
            background-color: #ff3333;
        }
        </style>
    </head>
    <body>
        <h1>Edit Product #<?php echo $row['p_name'];?></h1>

        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
            <label for="p_name">Product Name:</label>
            <input type="text" id="p_name" name="p_name" value="<?php echo $row['p_name']; ?>">

            

            <label for="p_price">Price:</label>
            <input type="text" id="p_price" name="p_price" value="<?php echo $row['p_price']; ?>">
            <input type="hidden" id="productID" name="productID" value="<?php echo $row['productID']; ?>">
            <input type="submit" name="submit" value="Update">
            <button type="button" class="form-button form-button-cancel" onclick="window.back();">Cancel</button>
        </form>
    </body>
</html>