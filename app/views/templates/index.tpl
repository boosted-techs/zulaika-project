<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Nansana Car Park</title>
    <!-- Favicon icon -->
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="/assets/logo.png">
    <link rel="stylesheet" href="/assets/vendor/chartist/css/chartist.min.css">
    <link href="/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="/assets/vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="/assets/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet"/>
    {block name="styles"}{/block}
    <link href="/assets/css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>

<!--*******************
    Preloader start
********************-->
<div id="preloader">
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div>
<!--*******************
    Preloader end
********************-->

<!--**********************************
    Main wrapper start
***********************************-->
<div id="main-wrapper">

    <!--**********************************
        Nav header start
    ***********************************-->
    <div class="nav-header">
        <a href="/dashboard" class="brand-logo">
            <img class="logo-abbr" src="/assets/logo.png" alt="">
            <img class="logo-compact" src="/assets/logo.png" alt="">
            <img class="brand-title" src="/assets/logo.png" alt="">
        </a>
        <div class="nav-control">
            <div class="hamburger">
                <span class="line"></span><span class="line"></span><span class="line"></span>
            </div>
        </div>
    </div>
    <!--**********************************
        Nav header end
    ***********************************-->


    <!--**********************************
        Header start
    ***********************************-->
    <div class="header">
        <div class="header-content">
            <nav class="navbar navbar-expand">
                <div class="collapse navbar-collapse justify-content-between">
                    <div class="header-left">
                        <div class="dashboard_bar">
                            Dashboard
                        </div>
                    </div>
                    <ul class="navbar-nav header-right">
                        <li class="nav-item">
                            <div class="input-group search-area d-xl-inline-flex d-none">
                                <div class="input-group-append">
                                    <span class="input-group-text"><a href="javascript:void(0)"><i class="flaticon-381-search-2"></i></a></span>
                                </div>
                                <input type="text" class="form-control" placeholder="Search here...">
                            </div>
                        </li>
                        <li class="nav-item dropdown header-profile">
                            <a class="nav-link" href="javascript:void(0)" role="button" data-toggle="dropdown">
                                <img src="/media/profile_pics/blank.png" width="20" alt=""/>
                                <div class="header-info">
                                    <span class="text-black"><strong>{$smarty.session.names}</strong></span>
                                    <p class="fs-12 mb-0">Admin</p>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a href="/_logout" class="dropdown-item ai-icon">
                                    <svg id="icon-logout" xmlns="http://www.w3.org/2000/svg" class="text-danger" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                                    <span class="ml-2">Logout </span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <!--**********************************
        Header end ti-comment-alt
    ***********************************-->

    <!--**********************************
        Sidebar start
    ***********************************-->
    <div class="deznav">
        <div class="deznav-scroll">
            <ul class="metismenu" id="menu">
                <li><a class="ai-icon" href="/dashboard" aria-expanded="false">
                        <i class="flaticon-381-networking"></i>
                        <span class="nav-text">Dashboard</span>
                    </a>
                </li>
                <li><a class="ai-icon" href="/parking-slots" aria-expanded="false">
                        <i class="flaticon-381-stopclock"></i>
                        <span class="nav-text">Parking slots</span>
                    </a>

                </li>
                <li><a class="ai-icon" href="/clients" aria-expanded="false">
                        <i class="flaticon-381-briefcase"></i>
                        <span class="nav-text">Clients</span>
                    </a>
                </li>
                <li><a class="ai-icon" href="/cars" aria-expanded="false">
                        <i class="flaticon-381-resume"></i>
                        <span class="nav-text">Cars</span>
                    </a>
                </li>
            </ul>
            <div class="copyright">
                <p><strong>TNI ONLINE ADMIN DASHBOARD</strong> ©  All Rights Reserved {$smarty.now|date_format:'%Y'}</p>
                <p>Made with <span class="heart"></span> by Ken</p>
            </div>
        </div>
    </div>
    <!--**********************************
        Sidebar end
    ***********************************-->

    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body">
        <!-- row -->
        <div class="container-fluid">
            {block name="body"}{/block}
        </div>
    </div>
    <!--**********************************
        Content body end
    ***********************************-->

    <!--**********************************
        Footer start
    ***********************************-->
    <div class="footer">
        <div class="copyright">
            <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Zulaika</a> {$smarty.now|date_format:'Y'}</p>
        </div>
    </div>
    <!--**********************************
        Footer end
    ***********************************-->

    <!--**********************************
       Support ticket button start
    ***********************************-->

    <!--**********************************
       Support ticket button end
    ***********************************-->


</div>
<!--**********************************
    Main wrapper end
***********************************-->

<!--**********************************
    Scripts
***********************************-->
<!-- Required vendors -->
<!-- modals -->

<script src="/assets/vendor/global/global.min.js"></script>
<script src="/assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="/assets/vendor/chart.js/Chart.bundle.min.js"></script>
<script src="/assets/js/custom.min.js"></script>
<script src="/assets/js/deznav-init.js"></script>
<script src="/assets/vendor/owl-carousel/owl.carousel.js"></script>
<script src="/assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
<Script src="/assets/axios/axios.min.js"></Script>
<script src="/assets/scripts.js"></script>
<script>
    {literal}
    $('.table').DataTable();
    {/literal}
</script>
{block name="scripts"}{/block}
</body>
</html>