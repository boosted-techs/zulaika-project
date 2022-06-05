{extends file="index.tpl"}
{block name="body"}
    <div class="row">
        <div class="col-xl-6 col-xxl-12">
            <div class="row">
                <div class="col-md-12 text-center p-3">
                    <h5 class="h5">CARS</h5>
                </div>
            </div>
        </div>
        <div class="col-md-12 shadow-sm p-3">
            <button class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModalLong">
                Add CAR TYPE
            </button>
        </div>
        <div class="col-md-12">
            {if isset($smarty.get.m)}
                <div class="alert alert-{if $smarty.get.s == 'ERROR'}danger{else}success{/if}">
                    {$smarty.get.m}
                </div>
            {/if}
            <table class="table table-responsive shadow-sm">
                <thead>
                <tr>
                    <th></th>
                    <th>CAR TYPE</th>
                    <th>RATE PER HOUR</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                {$i=1}
                {foreach $car_types as $car}
                    <tr {if $car.deleted == 1}class="bg-danger text-white"{/if}>
                        <td>{$i++}</td>
                        <td>{$car.type}</td>
                        <td>{$car.rate|number_format}</td>
                        <th>
                            <div class="dropdown">
                                <a href="javascript:void(0)" data-toggle="dropdown" ><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="18px" height="18px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="24" height="24"/><circle fill="#000000" cx="5" cy="12" r="2"/><circle fill="#000000" cx="12" cy="12" r="2"/><circle fill="#000000" cx="19" cy="12" r="2"/></g></svg></a>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li class="dropdown-item"><a href="/del/car-type/{$car.id}">
                                            {if $car.deleted == 1}
                                                <i class="fa fa-undo text-primary mr-2"></i> Recover
                                            {else}
                                                <i class="fa fa-ban text-primary mr-2"></i> Delete
                                            {/if}
                                        </a></li>
                                </ul>
                            </div></th>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
        <div class="col-md-12">
            <h2>CARS</h2>
            <table class="table">
                <thead>
                <tr>
                    <th></th>
                    <th>REG NO</th>
                    <th>DATE ADDED</th>
                    <th>COST/Hr</th>
                    <th>CAR TYPE</th>
                    <th>DESCRIPTION</th>
                </tr>
                </thead>
                <tbody>
                {$i = 1}
                {foreach $cars as $car}
                    <tr>
                        <td>{$i++}</td>
                        <td>{$car.reg_no}</td>
                        <td>{$car.date_added}</td>
                        <td>{$car.rate|number_format}</td>
                        <td>{$car.car_type}</td>
                        <td>{$car.description}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>

{/block}
{block name="scripts"}
    <div class="modal fade" id="exampleModalLong">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/data/add-car-type" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Car types</h5>
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Car type</label>
                            <input type="text" class="form-control" name="type" required placeholder="Car type"/>
                            <label>Parking Fee in UGX per hour</label>
                            <input type="number" class="form-control" name="fees" required placeholder="Parking fee"/>
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
