<?php
require 'vendor/autoload.php';

use PayPalCheckoutSdk\Core\PayPalHttpClient;
use PayPalCheckoutSdk\Core\SandboxEnvironment;

$clientId = 'AaOD9o7KNht0zHkqVLONNdlR8wuiE-O2VfzCC7KQznvEC7768rOL5x7IVPLm7ih6nyLIHD_Qld1f2o2O';
$clientSecret = 'EHWlTiYdA9VbLg2ewrRdO_kUb3xzHDWu7QXzw4sbT_8SrX9LrGiDm_xEhoLggU8dgiE6pUWlosGPebUY';

$environment = new SandboxEnvironment($clientId, $clientSecret);
$client = new PayPalHttpClient($environment);

