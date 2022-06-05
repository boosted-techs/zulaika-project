<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Nasana Car Park</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" href="/assets/logo.png">
    <link href="/assets/css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>

<body class="h-100">
<div class="authincation h-100">
    <div class="container h-100">
        <div class="row justify-content-center h-100 align-items-center">
            <div class="col-md-6">
                <div class="authincation-content bg-white">
                    <div class="row no-gutters">
                        <div class="col-xl-12">
                            <div class="auth-form">
                                <div class="text-center mb-3">
                                    <a href="/wp-admin"><img src="/assets/logo.png" style="width: 200px;" alt="Logo"></a>
                                </div>
                                <h4 class="text-center mb-4">RECEIPT</h4>
                                <table class="table">
                                    <tr><td>CUSTOMER NAME</td><td>{$bookings[0].names}</td></tr>
                                    <tr><td>REG NUMBER</td><td>{$bookings[0].reg_no}</td></tr>
                                    <tr><td>DATE</td><td>{$bookings[0].date_added}</td></tr>
                                    <tr><td>RATE</td><td>UGX {$bookings[0].rate|number_format}</td></tr>
                                    <tr><td>HOURS</td><td>{$bookings[0].hours}</td></tr>
                                    <tr><td>VEHICLE DETAILS</td><td><small>{$bookings[0].description}</small></td></tr>
                                    <tr class="bg-primary text-white"><td>COST</td><td>UGX {$bookings[0].rate * $bookings[0].hours}</td></tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!--**********************************
    Scripts
***********************************-->
<!-- Required vendors -->
<script src="/assets/vendor/global/global.min.js"></script>
<script src="/assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="/assets/js/custom.min.js"></script>
<script src="/assets/js/deznav-init.js"></script>

</body>

</html>