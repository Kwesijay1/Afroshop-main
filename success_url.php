<?php

//success_url.php
include 'components/connect.php';

session_start();

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
} else {
    header('location:home.php');
}

// Save order details in the database
$insert_order = $conn->prepare("INSERT INTO `orders`(user_id, name, email, number, method, address, total_products, total_price) VALUES(?,?,?,?,?,?,?,?)");
$insert_order->execute([$user_id, $_POST['name'], $_POST['email'], $_POST['number'], 'visa', $_POST['address'], $_POST['total_products'], $_POST['total_price']]);

// Clear the cart
$delete_cart = $conn->prepare("DELETE FROM `cart` WHERE user_id = ?");
$delete_cart->execute([$user_id]);

echo 'Order placed successfully!';
