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
