{extends file="index.tpl"}
{block name="body"}
    <div class="row">
        <div class="col-xl-6 col-xxl-12">
            <div class="row">
                <div class="col-md-12 text-center p-3">
                    <h5 class="h5">PARKING SLOTS</h5>
                </div>
            </div>
        </div>
        <div class="col-md-12 shadow-sm p-3">
            <button class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModalLong">
                Add new Slots
            </button>
        </div>
        <div class="col-md-12">
            {if isset($smarty.get.m)}
                <div class="alert alert-{if $smarty.get.s == 'ERROR'}danger{else}success{/if}">
                    {$smarty.get.m}
                </div>
            {/if}
            <div class="row">
                {foreach $slots as $slot}
                    <div class="col-md-3 col-sm-4 border border-info {if $slot.deleted == 1}bg-danger border-danger text-white{/if}{if $slot.slot_state == 1}bg-dark border-dark text-white{/if}">
                        <div class="dropdown">
                            <a href="javascript:void(0)" data-toggle="dropdown" ><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="18px" height="18px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="24" height="24"/><circle fill="#000000" cx="5" cy="12" r="2"/><circle fill="#000000" cx="12" cy="12" r="2"/><circle fill="#000000" cx="19" cy="12" r="2"/></g></svg></a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li class="dropdown-item"><a href="/del/slot/{$slot.id}">
                                        {if $slot.deleted == 1}
                                            <i class="fa fa-undo text-primary mr-2"></i> Recover
                                            {else}
                                            <i class="fa fa-ban text-primary mr-2"></i> Delete
                                        {/if}
                                    </a></li>
                            </ul>
                        </div>
                        <h1 class="text-center font-weight-bolder p-5">{$slot.label}</h1>
                        {if $slot.deleted == 1}
                            <p class="text-center">Deleted</p>
                        {/if}
                        {if $slot.slot_state == 1}
                            <p class="text-center">Occupied</p>
                        {/if}
                    </div>
                {/foreach}
            </div>
        </div>

    </div>

{/block}
{block name="scripts"}
    <div class="modal fade" id="exampleModalLong">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/data/add-slots" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Parking Slots</h5>
                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                            <div class="form-group">
                                <label>Parking label</label>
                                <input type="text" class="form-control" name="label" required placeholder="Label"/>
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
