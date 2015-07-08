$(document).ready(
    function() {
        var table = initOrderTable("order-table"),


        startDatePicker = $("#orderTimeStartDatePicker").datepicker({
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

        $("#goods-edit-form").ajaxForm();

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
                table = initOrderTable("order-table");
            }
        );

        $("#create-order-dialog").dialog({
            modal:true,
            width:500,
            buttons:[{
                text:"修改商品",
                click:function() {
                    //$("#goods-edit-form").ajaxSubmit({
                    //    success:function(data) {
                    //        if(data.result.name=="SUCCESS"){
                    //            $("#edit-goods-dialog").dialog("close");
                    //            $("#goods-table").dataTable().fnDestroy();
                    //            initTable("goods-table");
                    //        }
                    //        else {
                    //            alert("修改数据错误，请重新尝试");
                    //        }
                    //    }
                    //});
                }
            },{
                text:"关闭",
                click:function(){
                    $(this).dialog("close");
                }
            }]
        }).show();

        $("#select-goods-dialog").dialog({
            modal:true,
            width:500,
            buttons:[{
                text:"确定菜品",
                click:function() {
                    var elements = $("input[id*='productCount_']");
                    for(var i =0;i<elements.length;i++) {
                        var e = elements[i];
                        alert($(e).attr("id"));
                        alert($(e).val());
                    }
                }
            },{
                text:"关闭",
                click:function(){
                    $(this).dialog("close");
                }
            }]
        });
        $("#select-goods-dialog").dialog("close");


        $("#select-goods-button").click(function(event) {
            $("#select-goods-dialog").dialog("open");
            event.preventDefault();
        });

        initGoodsTable();
    }
);

function initGoodsTable() {
    $("#goods-table").dataTable(
        {
            "serverSide":true,
            "searching":false,
            "ajax": {
                "url":getApplicationContext()+"/admin/goods/list"
            },
            "columns":[
                {"data":"goodName","searchable":false,orderable:false},
                {"data":"price","searchable":false,orderable:false},
                {"data":"goodsCode","searchable":false,orderable:false,render:function(data, type, row){
                    return "<div class='action-buttons'><a href='#' onclick=\"addProduct('" + data + "')\"><i class='ace-icon glyphicon glyphicon-plus green'></i></a>" +
                        "<input disabled='false' type='text' style='width:50px;' value='0' id='productCount_"+data+"'></input><a href='#' onclick=\"deduceProduct('" + data + "')\"><i class='ace-icon glyphicon glyphicon-minus red'></i></a></div>";
                }}
            ]
        }
    );
}

function addProduct(goodsCode) {
    $("#productCount_" + goodsCode).val(parseInt($("#productCount_" + goodsCode).val())+1);
    event.preventDefault();
}

function deduceProduct(goodsCode) {
    var count = $("#productCount_" + goodsCode).val();
    if(parseInt(count)>0) {
        $("#productCount_" + goodsCode).val(count - 1);
    }
    event.preventDefault();
}


function initOrderTable(tableId) {
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
                {"data":"dateCreated","searchable":false},
                {"data":"orderStatus","searchable":false,ordable:false}
            ]
        });
}

