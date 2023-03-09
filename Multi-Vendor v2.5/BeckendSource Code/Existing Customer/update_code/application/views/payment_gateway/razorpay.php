<!DOCTYPE html>
<html>
<head>
    <title>Razorpay Payment With Codeigniter</title>
    <style>
    .card-product .img-wrap {
      border-radius: 3px 3px 0 0;
      overflow: hidden;
      position: relative;
      height: 220px;
      text-align: center;
    }
    .card-product .img-wrap img {
      max-height: 100%;
      max-width: 100%;
      object-fit: cover;
    }
    .card-product .info-wrap {
      overflow: hidden;
      padding: 15px;
      border-top: 1px solid #eee;
    }
    .card-product .bottom-wrap {
      padding: 15px;
      border-top: 1px solid #eee;
    }
 
    .label-rating { margin-right:10px;
      color: #333;
      display: inline-block;
      vertical-align: middle;
    }
 
    .card-product .price-old {
      color: #999;
    }
</style>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
<body>
<br><br><br>
<div class="row">
<div class="col-md-4">
 <a href="javascript:void(0)" class="btn btn-sm btn-primary buy_now" style="width: 200px;height: 52px;font-size: 23px;margin-left:30px;" data-amount="1000" data-id="1">RazorPay</a> 
</div> <!-- col // --><!-- col // -->
</div> <!-- row.// -->

<!--container.//-->
 
 
</body>
</html>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
  
  var SITEURL = "<?php echo base_url() ?>";
  var key = "<?php echo $key ?>";
  var systemName = "<?php echo $system_name ?>";
  var amount = "<?php echo $grandtotal ?>";
    
  $('body').on('click', '.buy_now', function(e){
    var totalAmount = $(this).attr("data-amount");
    var product_id =  $(this).attr("data-id");
    var options = {
    "key": key,
    "amount": (amount*100), // 2000 paise = INR 20
    "name": systemName,
    "description": "Payment",
    "handler": function (response){
          $.ajax({
            url: SITEURL + 'payment/razorPaySuccess',
            type: 'post',
            dataType: 'json',
            data: {
                razorpay_payment_id: response.razorpay_payment_id , totalAmount : totalAmount ,product_id : product_id,
            }, 
            success: function (msg) {
 
               window.location.href = SITEURL + 'payment/RazorThankYou';
            }
        });
      
    },
 
    "theme": {
        "color": "#528FF0"
    }
  };
  var rzp1 = new Razorpay(options);
  rzp1.open();
  e.preventDefault();
  });
 
</script>
