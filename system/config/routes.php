<?php

//Less define our simple routes in this file to help us map to the exact methods in our project

$route['']                                  =               "Home/index";
$route['admin/forgot-pwd']                  =               "Home/forgot_password";
$route['admin/signin']                      =               "Home/sign_in";
$route['cars']                              =               "Dashboard/cars";
$route['clients']                           =               "Dashboard/clients";
$route['dashboard']                         =               "Dashboard/index";
$route['data/add-car-type']                 =               "Dashboard/add_car_type";
$route['data/add-slots']                    =               "Dashboard/add_slot";
$route['data/book']                         =               "Bookings/reserve";
$route['del/car-type/(:any)']               =               "Dashboard/delete_car_type/$1";
$route['del/slot/(:any)']                   =               "Dashboard/delete_slot/$1";
$route['parking-slots']                     =               "Dashboard/parking_slots";
$route['s/car-look-up']                     =               "Cars/car_look_up";
$route['s/driver-look-up']                  =               "Drivers/driver_look_up";
