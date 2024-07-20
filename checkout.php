<?php

include 'components/connect.php';
include 'paypal_config.php';
include 'stripe_config.php';



session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
   header('location:home.php');
}

// Fetch user profile information
$fetch_profile_stmt = $conn->prepare("SELECT name, email, number, address FROM `users` WHERE id = ?");
$fetch_profile_stmt->execute([$user_id]);
$fetch_profile = $fetch_profile_stmt->fetch(PDO::FETCH_ASSOC);

$stripeConfig = include 'stripe_config.php';

if (!$stripeConfig || !isset($stripeConfig['secret_key'])) {
   die('Stripe configuration not set properly.');
}

require 'vendor/autoload.php';
$stripe = new \Stripe\StripeClient($stripeConfig['secret_key']);

if(isset($_POST['submit'])){

   $name = isset($_POST['name']) ? filter_var($_POST['name'], FILTER_SANITIZE_STRING) : '';
   $email = isset($_POST['email']) ? filter_var($_POST['email'], FILTER_SANITIZE_STRING) : '';
   $number = isset($_POST['number']) ? filter_var($_POST['number'], FILTER_SANITIZE_STRING) : '';
   $method = isset($_POST['method']) ? filter_var($_POST['method'], FILTER_SANITIZE_STRING) : '';
   $address = isset($_POST['address']) ? filter_var($_POST['address'], FILTER_SANITIZE_STRING) : '';
   $total_products = isset($_POST['total_products']) ? $_POST['total_products'] : '';
   $total_price = isset($_POST['total_price']) ? $_POST['total_price'] : '';

   $check_cart = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
   $check_cart->execute([$user_id]);

   if($check_cart->rowCount() > 0){

      if($address == ''){
         $message[] = 'please add your address!';
      }else{
         
         // Proceed with PayPal payment if the method is PayPal
         if ($method == 'paypal') {
            $request = new \PayPalCheckoutSdk\Orders\OrdersCreateRequest();
            $request->prefer('return=representation');
            $request->body = [
               "intent" => "CAPTURE",
               "purchase_units" => [[
                  "amount" => [
                     "value" => $total_price,
                     "currency_code" => "USD"
                  ]
               ]],
               "application_context" => [
                  "cancel_url" => "http://localhost/your_cancel_url.php",
                  "return_url" => "http://localhost/your_success_url.php"
               ]
            ];

            try {
               $response = $client->execute($request);
               $orderId = $response->result->id;
               foreach ($response->result->links as $link) {
                  if ($link->rel == 'approve') {
                     header('Location: ' . $link->href);
                     exit;
                  }
               }
            } catch (PayPalHttp\HttpException $ex) {
               echo $ex->statusCode;
               print_r($ex->getMessage());
            }
         } 
         //stripe payment gateway
         elseif($method == 'visa') {
                
                $stripe = new \Stripe\StripeClient($stripeConfig['secret_key']);

                try {
                    $session = $stripe->checkout->sessions->create([
                        'payment_method_types' => ['card'],
                        'line_items' => [[
                            'price_data' => [
                                'currency' => 'usd',
                                'product_data' => [
                                    'name' => 'Order Payment',
                                ],
                                'unit_amount' => $total_price * 100, // amount in cents
                            ],
                            'quantity' => 1,
                        ]],
                        'mode' => 'payment',
                        'success_url' => 'http://localhost/success_url.php',
                        'cancel_url' => 'http://localhost/cancel_url.php',
                    ]);

                    header('Location: ' . $session->url);
                    exit;
                } catch (Exception $e) {
                    $message[] = 'Payment failed, please try again.';
                }
            } 
        
         
         // MTN Mobile Money integration
         elseif ($method == 'mobilemoney') {
             include 'mtn_momo_config.php'; 
         
             
             $amount = $total_price;
             $party_id = $number;
         
             
             try {
                 $transactionId = "9edf526e-8a9c-4377-930b-6b05a8e4519f";
                 $response = $client->post('https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay', [
                     'headers' => [
                         'Authorization' => 'Bearer ' . $accessToken,
                         'X-Reference-Id' => $transactionId,
                         'X-Target-Environment' => 'sandbox', 
                         'Ocp-Apim-Subscription-Key' => $subscriptionKey,
                     ],
                     'json' => [
                         'amount' => $amount,
                         'currency' => 'EUR', 
                         'externalId' => $transactionId,
                         'payer' => [
                             'partyIdType' => 'MSISDN',
                             'partyId' => $party_id,
                         ],
                         'payerMessage' => 'Payment for order',
                         'payeeNote' => 'Payment for order',
                     ],
                 ]);
         
                 // Handle response
                 if ($response->getStatusCode() == 202) {
                     // Save order details in the database
                     $insert_order = $conn->prepare("INSERT INTO `orders`(user_id, name, email, number, method, address, total_products, total_price) VALUES(?,?,?,?,?,?,?,?)");
                     $insert_order->execute([$user_id, $name, $email, $number, $method, $address, $total_products, $amount]);
         
                     // Clear the cart
                     $delete_cart = $conn->prepare("DELETE FROM `cart` WHERE user_id = ?");
                     $delete_cart->execute([$user_id]);
         
                     $message[] = 'Order placed successfully!';
                 } else {
                     $message[] = 'Payment failed, please try again.';
                 }
             } catch (\GuzzleHttp\Exception\RequestException $e) {
                 echo 'Status Code: ' . $e->getResponse()->getStatusCode();
                 echo 'Reason: ' . $e->getResponse()->getReasonPhrase();
                 echo 'Body: ' . $e->getResponse()->getBody();
             }
         }
         
         else {
            $insert_order = $conn->prepare("INSERT INTO `orders`(user_id, name, email, number, method, address, total_products, total_price) VALUES(?,?,?,?,?,?,?,?)");
            $insert_order->execute([$user_id, $name, $email, $number ,$method, $address, $total_products, $total_price]);

            $delete_cart = $conn->prepare("DELETE FROM `cart` WHERE user_id = ?");
            $delete_cart->execute([$user_id]);

            $message[] = 'order placed successfully!';
         }
      }
      
   }else{
      $message[] = 'your cart is empty';
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>checkout</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<!-- header section starts  -->
<?php include 'components/user_header.php'; ?>
<!-- header section ends -->

<div class="heading">
   <h3>checkout</h3>
</div>

<section class="checkout">

<form action="" method="post">

   <div class="cart-items">
      <h3>cart items</h3>
      <?php
         $grand_total = 0;
         $cart_items = [];
         $select_cart = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
         $select_cart->execute([$user_id]);
         if($select_cart->rowCount() > 0){
            while($fetch_cart = $select_cart->fetch(PDO::FETCH_ASSOC)){
               $cart_items[] = $fetch_cart['name'].' ('.$fetch_cart['price'].' x '. $fetch_cart['quantity'].') - ';
               $total_products = implode($cart_items);
               $grand_total += ($fetch_cart['price'] * $fetch_cart['quantity']);
      ?>
      <p><span class="name"><?= $fetch_cart['name']; ?></span><span class="price">GHC<?= $fetch_cart['price']; ?> x <?= $fetch_cart['quantity']; ?></span></p>
      <?php
            }
         }else{
            echo '<p class="empty">your cart is empty!</p>';
         }
      ?>
      <p class="grand-total"><span class="name">grand total :</span><span class="price">GHC<?= $grand_total; ?></span></p>
      <a href="cart.php" class="btn">edit cart</a>
   </div>

   <input type="hidden" name="total_products" value="<?= $total_products; ?>">
   <input type="hidden" name="total_price" value="<?= $grand_total; ?>">

   <div class="user-info">
      <h3>your info</h3>
      <p><i class="fas fa-user"></i><span><?= $fetch_profile['name']; ?></span></p>
      <p><i class="fas fa-phone"></i><span><?= $fetch_profile['number']; ?></span></p>
      <p><i class="fas fa-envelope"></i><span><?= $fetch_profile['email']; ?></span></p>

      <a href="update_profile.php" class="btn">update info</a>
      <h3>delivery address</h3>
      <p><i class="fas fa-map-marker-alt"></i><span>
      <?php 
      if($fetch_profile['address'] == ''){
         echo 'please enter your address';}
         else{
            echo $fetch_profile['address'];}
      ?></span></p>
      <input type="hidden" name="address" value="<?= $fetch_profile['address'] ?>">

      <a href="update_address.php" class="btn">update address</a>
      <select name="method" class="box" required>
         <option value="" disabled selected>select payment method --</option>
         <option value="cash on delivery">cash on delivery</option>
         <option value="paypal">paypal</option>
         <option value="mobilemoney">Mobile Money</option>
         <option value="visa">Visa/Mastercard</option>
      </select>
      <input type="submit" value="place order" class="btn <?php if($fetch_profile['address'] == ''){echo 'disabled';} ?>" style="width:100%; background:var(--red); color:var(--white);" name="submit">
   </div>

</form>
   
</section>

<!-- footer section starts  -->
<?php include 'components/footer.php'; ?>
<!-- footer section ends -->

<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>
