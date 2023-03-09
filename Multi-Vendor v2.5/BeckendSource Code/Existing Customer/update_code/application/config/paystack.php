<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 

// --------------------------------------------------------------
// Paystack Payment Library Configuration
// 
// You can obtain these API keys via the link below:
// @link https://dashboard.paystack.com/#/settings/developer
// --------------------------------------------------------------

// Test Public Key (for testing purposes)
$config['test_public_key'] = 'pk_test_67cc7c0cf83ba2d7159e3ae555b6a097e2843166';

// Test Secret key (for testing purposes)
$config['test_secret_key'] = 'sk_test_5f926d7e94a4210d846f26e54ff9bede1f6a6211';

// Live Public Key (for production)
$config['live_public_key'] = 'pk_test_67cc7c0cf83ba2d7159e3ae555b6a097e2843166';

// Live Secret key (for production)
$config['live_secret_key'] = 'sk_test_5f926d7e94a4210d846f26e54ff9bede1f6a6211';

// API Mode (Remember to update this settings in your paystack dashboard)
$config['api_mode'] = 'TEST'; // Change this to LIVE when you are ready to start receiving payments