<?php 
    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $fnameCriteria = "";
    $lnameCriteria = "";
    $addressCriteria = "";
    $phoneCriteria = "";
    $currentPasswordCriteria = "";
    $newPasswordCriteria = "";
    $confirmPasswordCriteria = "";
    $delPasswordCriteria = "";

    $updateMessage = "";
    $passwordMessage = "";


    $product_category = $_POST['product_category'];
    $product_name = $_POST['product_name'];
    $product_image= $_POST['product_image'];
    $price = $_POST['price'];
    $product_description = $_POST['product_description'];


    



    if ($_SERVER["REQUEST_METHOD"] == "POST") {

            if($fnameOK == true || $lnameOK == true || $addressOK == true || $phoneOK || true || 1==1)
            {
                $sql = "UPDATE products SET p_name={$product_name}, p_desc='$product_description', p_img='$product_image', p_price='$price'";

                if(mysqli_query($conn, $sql))
                {
                    $updateMessage = '<i class="fas fa-check-square"></i>&nbsp&nbspRecord Updated!';
                }
                else {
                    $updateMessage = "Error Updating Records. Please try again later.";
                }
            }
    } else if(isset($_POST['revertProfile'])){
            Header('Location: '.$_SERVER['PHP_SELF']);

        } else if(isset($_POST['updatePassword'])){
            if (empty($_POST["currentPassword"])) {
                $currentPasswordCriteria = "Current password empty!";
            } else {
                $currentPassword = test_input($_POST["currentPassword"]);

                if(password_verify($currentPassword, $password)){

                    $newPassword = $_POST['newPassword'];
                    $confirmPassword = $_POST['confirmPassword'];

                    if(!preg_match('/^(?=.*\d)(?=.*[A-Za-z])[0-9A-Za-z!@#$%]{8,20}$/', $newPassword)) {
                        $newPasswordCriteria = 'Password does not meet requirements!';
                    } else if (!($newPassword == $confirmPassword))
                    {
                        $confirmPasswordCriteria = 'Passwords do not match';
                    } else {
                        $passHash = password_hash($newPassword, PASSWORD_BCRYPT);

                        $sql = "UPDATE user SET pass='$passHash' WHERE uname='$uname'";
                        if(mysqli_query($conn, $sql)){
                            $passwordMessage = "Password Updated!";
                            include "logout.php";
                            header("Location: login.php");
                        }
                    }
                }
                else
                {
                    $currentPasswordCriteria = "Current Password Incorrect!";
                }
            }
        } else if(isset($_POST['clearPassword'])){
            $_POST['currentPassword'] = "";
            $_POST['newPassword'] = "";
            $_POST['confirmPassword'] = "";

        } else if(isset($_POST['deleteAccount'])){
            if (empty($_POST["delPassword"])) {
                $delPasswordCriteria = "Current password empty!";
            } else {
                $delPassword = test_input($_POST["delPassword"]);

                if(password_verify($delPassword, $password)){
                    $sql = "DELETE FROM user WHERE uname='$uname'";

                    if(mysqli_query($conn, $sql)){
                        include "logout.php";
                        header("Location: index.php");
                    }
                }
                else
                {
                    $delPasswordCriteria = "Password Incorrect";
                }
            }
        }
    
?>