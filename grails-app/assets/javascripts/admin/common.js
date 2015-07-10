function getApplicationContext() {
    if($("#applicationContext")){
        return $("#applicationContext").val();
    }
    else {
        return "";
    }

}

function isEmpty(content) {
    if(content == "" || content == null || !(content.length > 0)){
        return true;
    }
    else {
        return false;
    }
}

function clearElementsValue(eles) {
    for(var i =0;i<eles.length;i++) {
        $("#" + eles[i]).val("");
    }
}

function setElementsValue(eles,values) {
    for(var i =0;i<eles.length;i++) {
        $("#" + eles[i]).val(values[i]);
    }
}


function activeMenu(id) {
    $("#order-menu-li").attr("css", "");
    $("#goods-menu-li").attr("css", "");
    $("#" + id).attr("css", "active");
}