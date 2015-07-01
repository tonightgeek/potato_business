$(document).ready(
    function() {
        var table = initTable("order-table");

        var startDatePicker = $("#orderTimeStartDatePicker").datepicker({
            onSelect:function(date,datePicker){
                $("#orderTimeStart").val(date);
                $(this).hide();
            }
        }).hide(),

        endDatePicker = $("#orderTimeEndDatePicker").datepicker({
            onSelect:function(date,datePicker){
                $("#orderTimeEnd").val(date);
                $(this).hide();
            }
        }).hide(),

        sendTimeStartPicker = $("#sendTimeStartDatePicker").datepicker({
            onSelect:function(date,datePicker){
                $("#sendTimeStart").val(date);
                $(this).hide();
            }
        }).hide(),

        sendTimeEndPicker = $("#sendTimeEndDatePicker").datepicker({
            onSelect:function(date,datePicker){
                $("#sendTimeEnd").val(date);
                $(this).hide();
            }
        }).hide();

        $("#orderTimeStart").click(function() {
            startDatePicker.show();

        });

        $("#sendTimeStart").click(function() {
            sendTimeStartPicker.show();
        });


        $("#sendTimeEnd").click(function() {
            sendTimeEndPicker.show();
        });

        $("#search-table-button").click(
            function() {
                $("#order-table").dataTable().fnDestroy();
                table = initTable("order-table");
            }
        );
    }
);


function initTable(tableId) {
    $("#"+tableId).on('preXhr.dt', function ( e, settings, data ) {
            if(data.order[0].column == 3){
                data.sort = "totalPrice";
                data.order = data.order[0].dir;
            }
            else if (data.order[0].column == 4) {
                data.sort = "sendDate";
                data.order = data.order[0].dir;
            }else if (data.order[0].column) {
                data.sort = "dateCreated";
                data.order = data.order[0].dir;
            }

            if(!isEmpty($("#orderTimeStart").val())) {
                data.startOrderTime = $("#orderTimeStart").val();
            }

            if(!isEmpty($("#orderTimeEnd").val())) {
                data.endOrderTime = $("#orderTimeEnd").val();
            }

            if(!isEmpty($("#sendTimeStart").val())) {
                data.startSendTime = $("#sendTimeStart").val();
            }

            if(!isEmpty($("#sendTimeEnd").val())) {
                data.endSendTime = $("#sendTimeEnd").val();
            }
        } )
        .dataTable({
            "serverSide":true,
            "searching":false,
            "ajax": {
                "url":getApplicationContext()+"/admin/order/list"
            },
            "columns":[
                {"data":"code","searchable":false,orderable:false},
                {"data":"contactName","searchable":false,orderable:false},
                {"data":"address","searchable":false,orderable:false},
                {"data":"totalPrice","searchable":false},
                {"data":"sendDate","searchable":false},
                {"data":"dateCreated","searchable":false}
            ]
        });
}
