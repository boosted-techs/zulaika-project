function searchPhone() {
    let phone = $("#phone").val()
    axios("/s/driver-look-up?no=" + phone )
        .then(function(r){
            let html
            let data = r.data
            if (data) {
                console.log(data)
                html = `
                <div class="border border-info p-4 shadow-sm mt-3">
                    <input type="hidden" name="user_id" value="` + data.id + `">
                    <table class="table">
                        <tr>
                            <td>Names</td>
                            <td>` + data.names + `</td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td>` + data.phone_number + `</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>` + data.email + `</td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>` + data.gender + `</td>
                        </tr>
                        <tr>
                            <td>Residence</td>
                            <td>` + data.residence + `</td>
                        </tr>
                    </table>                  
                </div>
                `
            } else {
                html = `
                <div class="border border-info p-4 shadow-sm mt-3">
                    <label>Client's name</label>
                    <input type="text" class="form-control mt-2" name="names" required/>
                    <label>Email address</label>
                    <input type="email" class="form-control  mt-2" name="email">
                    <label>Address</label>
                    <input type="text" class="form-control  mt-2" name="address" placeholder="eg Nansana Masitoowa"/>
                    <label>Gender</label>
                    <select class="form-control  mt-2" name="gender">
                        <option>M</option>
                        <option>F</option>
                    </select>
                </div>
               
                `
            }
            $("#personal_data") . html(html) . append(`
                <div class='mt-2'>
                 <label>Customer phone number</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="car" name="car" required placeholder="CAR REG"/>
                                <button type="button" class="btn btn-outline-warning rounded-0 rounded-right" onclick="carLookUp()">Search</button>
                            </div>
                </div>
               <div id="car-details"></div>
            `)
        })
}

function carLookUp() {
    let reg = $("#car").val()
    axios("/s/car-look-up?no=" + reg )
        .then(function(r) {
            let html
            let data = r.data
            if (data) {
                data = data[0]
                html = `
                <div class="border border-info p-4 shadow-sm mt-3">
                    <input type="hidden" name="car_id" value="` + data.id + `">
                    <table class="table">
                        <tr>
                            <td>Car Type</td>
                            <td>` + data.car_type + `</td>
                        </tr>
                        <tr>
                            <td>REG NO.</td>
                            <td>` + data.reg_no + `</td>
                        </tr>
                        <tr>
                            <td>rate</td>
                            <td>` + data.rate + `</td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>` + data.description + `</td>
                        </tr>                       
                    </table>                  
                </div>
                `
            } else {
                html = `
                <div class="border border-info p-4 shadow-sm mt-3">
                    <label>car type</label> <select class="form-control" name='type'>`
                    carTypes.forEach(function(car) {
                        let deleted  = car.deleted === 1 ? 'disabled' : ''
                        html += '<option value="' + car.id + '" ' + deleted + '>' + car.type + '" -@' + car.rate +'</option>'
                    })
                    html += `</select><label>Description</label>  
                    <input type="text" name="description" class="form-control" placeholder="Describe the car">               
                </div>
                `
            }
            let i = `<hr/>
            <h3>PARKING SLOT</h3>
            <select class="form-control" name="slot">`
                slots.forEach(function(slot){
                    let deleted  = slot.deleted === 1 ? 'disabled' : (slot.slot_state === 1 ? 'disabled' : '')
                    i += '<option value="' + slot.id + '" ' + deleted + '>' + slot.label + '</option>'
                })
                i += `</select>`
            $("#car-details").html(html) .append(i)
        })
}