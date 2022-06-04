function searchPhone() {
    let phone = $("#phone").val()
    axios("/s/driver-look-up?no=" + phone )
        .then(function(r){
            let html
            let data = r.data
            if (data) {
                console.log(444)
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
                console.log(434343)
                console.log(data)
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
                    let deleted  = slot.deleted === 1 ? 'disabled' : ''
                    i += '<option value="' + slot.id + '" ' + deleted + '>' + slot.label + '</option>'
                })
                i += `</select>`
            $("#car-details").html(html) .append(i)
        })
}