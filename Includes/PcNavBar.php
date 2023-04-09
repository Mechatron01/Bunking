<?php include "./AdditionalPHP/checkAccess.php"; ?>

<?php 

    if(!isset($_SESSION))
    {
        session_start();
    }
    
    if(isset($_SESSION['uname'])){
        $href = 'checkAccount.php';
        $icon = 'bx bxs-user-circle';
        $cartHref = 'cart.php';
    } else {
        $href = 'login.php';
        $icon = 'bx bx-user-circle';
        $cartHref = 'login.php';
    }
?>

<header class="<?php if($page == 'index' || $page == 'products'){echo 'indexNav';}?> main-header-media1200">
    <nav class="nav-media1200 main-nav-media1200">

        <h4 class="business-name-media1200"><a href="index.php" class="animate__animated animate__backInDown">Bun King</a></h4>

        <ul class="animate__animated animate__backInDown">
            <li style="padding: 0 0;"><a href="index.php" class="<?php if($page == 'index'){echo 'active';}?>">HOME</a></li>

            <li><a href="products.php" class="<?php if($page == 'products'){echo 'active';}?>">PRODUCTS</a></li>
            
            <li><a href="about.php" class="<?php if($page == 'about'){echo 'active';}?>">ABOUT</a></li>

            <li><a href="contact.php" class="<?php if($page == 'contact'){echo 'active';}?>">CONTACT US</a></li>

            <li><a href="<?php echo $cartHref;?>" class="<?php if($page == 'cart'){echo 'active';}?>"><i class="bx bx-cart nav__cart"></i></a>
           
        </li>
            
            <li><a href="<?php echo $href;?>" class="<?php if($page == 'login' || $page == 'checkaccount'){echo 'active';}?> user-button"><i class="<?php echo $icon;?>"></i></a></li>
        </ul>
    </nav>
</header>

