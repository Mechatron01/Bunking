<?php
include "./connection.php";
include "./AdditionalPHP/startSession.php";

// Query the database to get the list of categories
$sql_categories = "SELECT categoryid, p_cat_name FROM categories ORDER BY p_cat_name";
$result_categories = mysqli_query($conn, $sql_categories);

// Query the database to get the list of product types
$sql_types = "SELECT typeid, p_type_name FROM types ORDER BY p_type_name";
$result_types = mysqli_query($conn, $sql_types);

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the form data
    $product_name = $_POST["product_name"];
    $product_description = $_POST["product_description"];
    $product_image_path = "Assets/images/products/" . $_POST['product_image_name'];
    $product_price = $_POST["product_price"];
    $product_category = $_POST["product_category"];
    $product_type = $_POST["product_type"];
    


    // Insert the new product into the products table
    $sql_insert_product = "INSERT INTO products (p_name, p_desc, p_img, p_price) VALUES ('$product_name', '$product_description', '$product_image_path', '$product_price')";
    mysqli_query($conn, $sql_insert_product);

    // Get the ID of the newly inserted product
    $product_id = mysqli_insert_id($conn);

    // Insert the product category into the product_category table
    $sql_insert_product_category = "INSERT INTO product_category (productid, categoryid) VALUES ('$product_id', '$product_category')";
    mysqli_query($conn, $sql_insert_product_category);

    // Insert the product type into the product_type table
    $sql_insert_product_type = "INSERT INTO product_type (productid, typeid) VALUES ('$product_id', '$product_type')";
    mysqli_query($conn, $sql_insert_product_type);
    
    // Redirect to the products list page
    header("Location: products.php");
    exit();
}
?>  
<!DOCTYPE html>
<html lang="en-MU">

<head>
<style>
        /* CSS styles for the form */
        body {
            font-family: Arial, sans-serif;
        }
        
        h1 {
            text-align: center;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f2f2f2;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .form-button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
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
    <h1>Add New Product</h1>
    <form method="post">
        <div>
            <label for="product_name">Product Name:</label>
            <input type="text" id="product_name" name="product_name" required>
        </div>
        <div>
            <label for="product_description">Product Description:</label>
            <textarea id="product_description" name="product_description"></textarea>
        </div>
        <div>
            <label for="product_image_name">Product Image Name with exension:</label>
            <input type="text" id="product_image_name" name="product_image_name" required>          

        <div>
            <label for="product_price">Product Price:</label>
            <input type="number" id="product_price" name="product_price" min="0" step="0.10" required>
        </div>
        <div>
            <label for="product_category">Product Category:</label>
            <select id="product_category" name="product_category">
                <?php
                // Loop through the categories and create an option for each one
                while ($row = mysqli_fetch_assoc($result_categories)) {
                    echo '<option value="' . $row["categoryid"] . '">' . $row["p_cat_name"] . '</option>';
                }
                ?>
            </select>
        </div>
        <div>
            <label for="product_type">Product Type:</label>
            <select id="product_type" name="product_type">
                <?php
                // Loop through the types and create an option for each one
                while ($row = mysqli_fetch_assoc($result_types)) {
                    echo '<option value="' . $row["typeid"] . '">' . $row["p_type_name"] . '</option>';
                }
                ?>
            </select>
        </div>
        <button type="submit" style="background-color: #4CAF50; color: white; padding: 12px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px;">Add Product</button>
        <button type="button" class="form-button form-button-cancel" onclick="window.history.back();">Cancel</button>

    </form>
 
</body>

</html>