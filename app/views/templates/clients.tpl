{extends file="index.tpl"}
{block name="body"}
    <div class="row">
        <div class="col-xl-6 col-xxl-12">
            <div class="row">
                <div class="col-md-12 text-center p-3">
                    <h5 class="h5">CLIENTS</h5>
                </div>
                <div class="col-md-12">
                    <table class="table">
                        <thead>
                        <tr>
                            <th></th>
                            <th>Names</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Residence</th>
                            <th>Gender</th>
                            <Th>Bookings</Th>
                        </tr>
                        </thead>
                        <tbody>
                        {$i = 1}
                            {foreach $clients as $client}
                                <tr>
                                    <td>{$i++}</td>
                                    <td>{$client.names}</td>
                                    <td>{$client.phone_number}</td>
                                    <td>{$client.email}</td>
                                    <td>{$client.residence}</td>
                                    <td>{$client.gender}</td>
                                    <td>{$client.bookings}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

{/block}