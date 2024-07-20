<?php

require __DIR__ . '/vendor/autoload.php';

use GuzzleHttp\Client;


$baseUrl = "https://sandbox.momodeveloper.mtn.com";
$apiUser = "c60112cc-ade2-4026-9979-e51bafe81948";
$apiKey = "7f51ae61d9ea4599af2c739b8e0a3a27";
$subscriptionKey = "de23706547db4e4a8928ad587cecfbfe";
$currency = "EUR"; 


$client = new Client([
    'base_uri' => $baseUrl,
    'timeout'  => 2.0,
]);

// Function to get access token
function getAccessToken($client, $apiUser, $apiKey, $subscriptionKey) {
    $response = $client->post('/collection/token/', [
       'headers' => [
         'Authorization' => 'Basic ' . base64_encode("$apiUser:$apiKey"),
          'Ocp-Apim-Subscription-Key' => $subscriptionKey,
        ],
    ]);
    
    $body = json_decode($response->getBody(), true);
    return $body['access_token'];
}

$accessToken = getAccessToken($client, $apiUser, $apiKey, $subscriptionKey);

