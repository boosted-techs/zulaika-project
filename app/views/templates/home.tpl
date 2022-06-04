{extends file="index.tpl"}
{block name="body"}
    <div class="row">
        <div class="col-xl-6 col-xxl-12">
            <div class="row">
                <div class="col-md-12 text-center p-3">
                    <h5 class="h5">Welcome to Nansana Car Park Management System</h5>
                    {if isset($smarty.get.m)}
                        <div class="alert alert-{if $smarty.get.s == 'ERROR'}danger{else}success{/if}">
                            {$smarty.get.m}
                        </div>
                    {/if}
                    <div class="col-md-12 shadow-sm p-3">
                        <button class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModalLong">
                           BOOK SPACE
                        </button>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card avtivity-card">
                        <div class="card-body">
                            <div class="media align-items-center">
                                <span class="activity-icon bgl-success mr-md-4 mr-3">
                                                            <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <g clip-path="url(#clip2)">
                                                                <path d="M14.6406 24.384C14.4639 24.1871 14.421 23.904 14.5305 23.6633C15.9635 20.513 14.4092 18.7501 14.564 11.6323C14.5713 11.2944 14.8346 10.9721 15.2564 10.9801C15.6201 10.987 15.905 11.2962 15.8971 11.6598C15.8902 11.9762 15.8871 12.2939 15.8875 12.6123C15.888 12.9813 16.1893 13.2826 16.5583 13.2776C17.6426 13.2628 19.752 12.9057 20.5684 10.4567L20.9744 9.23876C21.7257 6.9847 20.4421 4.55115 18.1335 3.91572L13.9816 2.77294C12.3274 2.31768 10.5363 2.94145 9.52387 4.32498C4.66826 10.9599 1.44452 18.5903 0.0754914 26.6727C-0.300767 28.8937 0.754757 31.1346 2.70222 32.2488C13.6368 38.5051 26.6023 39.1113 38.35 33.6379C39.3524 33.1709 40.0002 32.1534 40.0002 31.0457V19.1321C40.0002 18.182 39.5322 17.2976 38.7484 16.7664C34.5339 13.91 29.1672 14.2521 25.5723 18.0448C25.2519 18.3828 25.3733 18.937 25.8031 19.1166C27.4271 19.7957 28.9625 20.7823 30.2439 21.9475C30.5225 22.2008 30.542 22.6396 30.2654 22.9155C30.0143 23.1658 29.6117 23.1752 29.3485 22.9376C25.9907 19.9053 21.4511 18.5257 16.935 19.9686C16.658 20.0571 16.4725 20.3193 16.477 20.61C16.496 21.8194 16.294 22.9905 15.7421 24.2172C15.5453 24.6544 14.9607 24.7409 14.6406 24.384Z" fill="#27BC48"/>
                                                                </g>
                                                                <defs>
                                                                <clipPath id="clip2">
                                                                <rect width="40" height="40" fill="white"/>
                                                                </clipPath>
                                                                </defs>
                                                            </svg>
                                                        </span>
                                <div class="media-body">
                                    <p class="fs-14 mb-2">All cars parked</p>
                                    <span class="title text-black font-w600">1000</span>
                                </div>
                            </div>
                            <div class="progress" style="height:5px;">
                                <div class="progress-bar bg-success" style="width: 42%; height:5px;" role="progressbar">
                                    <span class="sr-only">42% Complete</span>
                                </div>
                            </div>
                        </div>
                        <div class="effect bg-success"></div>
                    </div>
                </div>
                    <div class="col-sm-3">
                        <div class="card avtivity-card">
                            <div class="card-body">
                                <div class="media align-items-center">
                                                        <span class="activity-icon bgl-danger mr-md-4 mr-3">
                                                            <h1 class="fa fa-file-video-o"></h1>
                                                        </span>
                                    <div class="media-body">
                                        <p class="fs-14 mb-2">Free space</p>
                                        <span class="title text-black font-w600">400</span>
                                    </div>
                                </div>
                                <div class="progress" style="height:5px;">
                                    <div class="progress-bar bg-danger" style="width: 42%; height:5px;" role="progressbar">
                                        <span class="sr-only">42% Complete</span>
                                    </div>
                                </div>
                            </div>
                            <div class="effect bg-danger"></div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card avtivity-card">
                            <div class="card-body">
                                <div class="media align-items-center">
                                                        <span class="activity-icon bgl-warning mr-md-4 mr-3">
                                                            <h1 class="fa fa-book"></h1>
                                                        </span>
                                    <div class="media-body">
                                        <p class="fs-14 mb-2">Occupied space</p>
                                        <span class="title text-black font-w600">300</span>
                                    </div>
                                </div>
                                <div class="progress" style="height:5px;">
                                    <div class="progress-bar bg-warning" style="width: 42%; height:5px;" role="progressbar">
                                        <span class="sr-only">42% Complete</span>
                                    </div>
                                </div>
                            </div>
                            <div class="effect bg-warning"></div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="card avtivity-card">
                            <div class="card-body">
                                <div class="media align-items-center">
                                                        <span class="activity-icon bgl-danger mr-md-4 mr-3">
                                                            <h1 class="fa fa-file-video-o"></h1>
                                                        </span>
                                    <div class="media-body">
                                        <p class="fs-14 mb-2">Amount collected</p>
                                        <span class="title text-black font-w600">UGX 300,000</span>
                                    </div>
                                </div>
                                <div class="progress" style="height:5px;">
                                    <div class="progress-bar bg-info" style="width: 45%; height:5px;" role="progressbar">
                                        <span class="sr-only">42% Complete</span>
                                    </div>
                                </div>
                            </div>
                            <div class="effect bg-info"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <div class="row">
        <div class="col-md-12">
            <h3>RECENT ACTIVITY</h3>
            <table class="table shadow table-responsive">
                <thead>
                <tr>
                    <th>S.no</th>
                    <th>SLOT</th>
                    <th>CAR</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>TIME</th>
                    <th>Car type</th>
                    <th>Rate</th>
                    <th>Car Details</th>
                    <th>Client</th>
                    <th>Gender</th>
                    <th>Client Residence</th>
                    <th>Phone</th>
                </tr>
                </thead>
                <tbody>
                {$i = 1}
                {foreach $bookings as $booking}
                    <tr {if $booking.status == 1}class="text-danger font-weight-bolder"{/if}>
                        <td>{$i++}</td>
                        <td>{$booking.slot}</td>
                        <td>{$booking.reg_no}</td>
                        <td>{$booking.date_added}</td>
                        <td>{if $booking.status == 1}ONBOARD{else}OFF BOARD{/if}</td>
                        <td>{$booking.on_time} - {if $booking.status == 0}{$booking.off_time}{/if}
                        </td>
                        <td>{$booking.type}</td>
                        <td>{$booking.rate|number_format}</td>
                        <td>{$booking.description}</td>
                        <td>{$booking.names}</td>
                        <td>{$booking.gender}</td>
                        <td>{$booking.residence}</td>
                        <td>{$booking.phone_number}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
    <script>
        let carTypes = {$car_types|json_encode};
        let slots = {$slots|json_encode};
    </script>
{/block}
{block name="scripts"}
    <div class="modal fade" id="exampleModalLong">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/data/book" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Book / Reserve</h5>
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Customer phone number</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="phone" name="phone" required placeholder="Phone number"/>
                                <button type="button" class="btn btn-outline-warning rounded-0 rounded-right" onclick="searchPhone()">Search</button>
                            </div>
                            <div id="personal_data"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger light" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
{/block}
