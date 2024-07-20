<?php

$paymentMethod = $_POST['method'];

if ($paymentMethod === 'paypal') {
    header('Location: paypal_payment.php');
    exit;
} elseif ($paymentMethod === 'mobilemoney') {
    header('Location: mtn_momo_payment.php');
    exit;
} else {
    echo "Unsupported payment method.";
}

