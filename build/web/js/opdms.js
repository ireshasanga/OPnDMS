/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function setMethod(fieldId, method) {

    document.getElementById(fieldId).value = method;

}

function te(itemId, sessionId) {
    var orderQuantity = document.getElementById(itemId).value;
    var xmlHttp = getAjaxObject();
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {

            var reply = JSON.parse(xmlHttp.responseText) // This will pass only json objects
//            alert(reply.status);
            alert(reply.no_of_items);
            var arr = reply.items;
            for (var i = 0; i < arr.length; i++) {
                var obj = arr[i];
//                alert("id = " + obj.item_id + " Order Quantity = " + obj.order_quantity)
            }
        }
    };
    xmlHttp.open("POST", "CartController?itemId=" + itemId + "&orderQuantity=" + orderQuantity + "&sessionId=" + sessionId, true);
    xmlHttp.send();
}

//For view more details of the selected item
function viewMoreInfo(itemCode) {
//    alert(document.getElementById("selectedItem").value);
    document.getElementById("selectedItem").value = itemCode;
//    alert(itemCode);
    return true;
}

// Validate payment and get data for the payment controller
function validatePayment() {
    alert("inside Validate payment");
    var itemsTable = document.getElementById('itemsTable').getElementsByTagName('tbody')[0];
    console.log(itemsTable);
    var items = "";
    for (var i = 0; i < itemsTable.rows.length; i++) {
        alert("inside table loop");
       var r = itemsTable.rows[i];
        var itemId = r.cells[5].innerHTML;
        var up = r.cells[3].innerHTML;
        var qty = r.cells[1].innerHTML;
        var desc = r.cells[6].innerHTML;
        
        alert("ItemId"+itemId);
        alert("up"+up);
        items += itemId + "@td" + up + "@td" + qty + "@td" + desc +"@tr";
        console.log(itemsTable);

alert("items :"+items);

    }

    var address = document.getElementById("addressInpt").value;
    document.getElementById("address").value = address;
//    alert("address :" + address);
    items = items.substr(0, items.lastIndexOf("@tr"));
    document.getElementById('items').value = items;

    var customerName = document.getElementById("crncyGetVal").value;
    document.getElementById("cusName").value = customerName;
    return confirm("Confirm Payment");






}
