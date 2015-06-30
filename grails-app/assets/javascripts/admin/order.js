$(document).ready(
    function() {
        var table = $("#order-table")
            .on('preXhr.dt', function ( e, settings, data ) {
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
                    data.startSendTime = $("orderTimeStart").val();
                }

                if(!isEmpty($("#orderTimeEnd").val())) {
                    data.endSendTime = $("orderTimeEnd").val();
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

        var startDatePicker = $("#orderTimeStartDatePicker").datepicker({
            showButtonPanel:true,
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
        }).hide();

        $("#orderTimeStart").click(function() {
            startDatePicker.show();

        });

        $("#orderTimeEnd").click(function() {
            endDatePicker.show();
        });
    }
);