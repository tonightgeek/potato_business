$(document).ready(
    function() {
        activeMenu("order-menu-li");

        var table = initOrderTable("order-table"),
        startDatePicker = $("#orderTimeStartDatePicker").datepicker({
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
        }).hide(),

        sendTimeStartPicker = $("#sendTimeStartDatePicker").datepicker({
            showButtonPanel:true,
            onSelect:function(date,datePicker){
                $("#sendTimeStart").val(date);
                $(this).hide();
            }
        }).hide(),

        sendTimeEndPicker = $("#sendTimeEndDatePicker").datepicker({
            showButtonPanel:true,
            onSelect:function(date,datePicker){
                $("#sendTimeEnd").val(date);
                $(this).hide();
            }
        }).hide();

        $("#goods-create-form").ajaxForm();

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
                text:"下单",
                click:function() {
                    $("#goods-create-form").ajaxSubmit({
                        success:function(data) {
                            if(data.result.name=="SUCCESS"){
                                $("#create-order-dialog").dialog("close");
                                location.reload();
                            }
                            else {
                                alert("修改数据错误，请重新尝试");
                            }
                        }
                    });
                }
            },{
                text:"关闭",
                click:function(){
                    $(this).dialog("close");
                }
            }]
        }).show();

        $("#order-detail-dialog").dialog({
            modal:true,
            width:500,
            buttons:[{
                text:"关闭",
                click:function() {
                    $(this).dialog("close");
                }}
            ]
        });
        $("#order-detail-dialog").dialog("close");

        $("#select-goods-dialog").dialog({
            modal:true,
            width:500,
            buttons:[{
                text:"确定菜品",
                click:function() {
                    var elements = $("input[id*='productCount_']");
                    $("#goods-list").html("");
                    var resultHtml = '',
                        totalPrice = 0,
                        formElementHtml = '';
                    for(var i =0;i<elements.length;i++) {
                        var e = elements[i],
                        goodsCode = $(e).attr("id").substr($(e).attr("id").indexOf("_") + 1),
                        goodsCount = $(e).val(),
                        goodsPrice = $(e).parent().parent().prev().html(),
                        goodsName = $(e).parent().parent().prev().prev().html();
                        if(goodsCount > 0) {
                            resultHtml += "<li class='item-orange clearfix'>"+goodsName+"<span class='pull-right'>" + goodsCount + "份&nbsp;&nbsp;"
                            + goodsPrice +"元</span></li>";
                            formElementHtml += "<input type='hidden' name='orderItemCommandList["+i+"].goodsName' value='"+goodsName+"'></input>";
                            formElementHtml += "<input type='hidden' name='orderItemCommandList["+i+"].goodsCount' value='"+goodsCount+"'></input>";
                            formElementHtml += "<input type='hidden' name='orderItemCommandList["+i+"].goodsCode' value='"+goodsCode+"'></input>";
                            totalPrice = parseFloat(parseFloat(totalPrice) + parseFloat(goodsPrice * goodsCount)).toFixed(2);
                        }
                    }
                    $("#ordersHiddenDiv").html(formElementHtml);
                    if(totalPrice > 0 ) {
                        resultHtml += "<li class='item-orange clearfix'><span class='pull-right'>总价:"
                        + totalPrice +"元</span></li>";
                    }
                    $("#goods-list").html(resultHtml);

                    $(this).dialog("close");
                }
            },{
                text:"关闭",
                click:function(){
                    $(this).dialog("close");
                }
            }]
        });
        $("#select-goods-dialog").dialog("close");

        $("#create-order-dialog").dialog("close");
        $("#select-goods-button").click(function(event) {
            $("#goods-table").dataTable().fnDestroy();
            $("#select-goods-dialog").dialog("open");
            initGoodsTable();
            event.preventDefault();
        });

        initGoodsTable();

        $("#create-order-button").click(
            function() {
                $("#create-order-dialog").dialog("open");
                clearElementsValue(['create-order-order-contact','create-order-order-phone','create-order-order-address',
                'create-order-send-time','create-order-remark']);
                $("#change-member-contract-name").val('false');
                $("#change-member-contract-name").prev().attr("class","");
                $("#change-member-contract-address").val('false');
                $("#change-member-contract-address").prev().attr("class","");
                $("#goods-list").html("");
            }
        );

        $("#create-order-order-phone").blur(
            function() {
                var mobile = $("#create-order-order-phone").val();
                if(!isEmpty(mobile)){
                    $("#create-order-dialog").parent().isLoading({
                        text:'Loading',
                        position:'overlay'
                    });
                    $.getJSON(getApplicationContext()+"/admin/member/mobile",
                        {mobile:$("#create-order-order-phone").val()},
                            function(data){
                                if(data.data) {
                                    $("#create-order-order-contact").val(data.data.userName);
                                    $("#create-order-order-address").val(data.data.address);
                                }
                                else {
                                    $("#create-order-order-contact").val("");
                                    $("#create-order-order-address").val("");
                                }
                                $("#create-order-dialog").parent().isLoading("hide");
                            }
                    );
                }
            }
        );

        $("#create-order-send-time").timepicker();


        $("#add-remark-dialog").dialog({
            modal: true,
            width: 500,
            buttons: [{
                text: "修改备注",
                click:function() {
                    $.getJSON(getApplicationContext()+"/admin/order/modifyRemark",
                        {orderCode:$("#add-remark-order-code").val(),
                            remark:$("#add-remark-text-area").val()
                        },
                        function(data){
                            if(data.data!=true){
                                alert("服务器错误,重新尝试");
                            }
                            $("#add-remark-dialog").dialog("close");
                        }
                    );
                }
            },{
                text:"关闭",
                click:function(){
                    $(this).dialog("close");
                }
            }]
        });
        $("#add-remark-dialog").dialog("close");
    }
);

function initGoodsTable() {
    $("#goods-table").dataTable(
        {
            "serverSide":true,
            "searching":false,
            "ajax": {
                "url":getApplicationContext()+"/admin/goods/list?filterOffSale=true"
            },
            "columns":[
                {"data":"goodName","searchable":false,orderable:false},
                {"data":"basePrice","searchable":false,orderable:false},
                {"data":"goodsCode","searchable":false,orderable:false,render:function(data, type, row){
                    return "<div class='action-buttons'><a href='#' onclick=\"addProduct(event,'" + data + "')\"><i class='ace-icon glyphicon glyphicon-plus green'></i></a>" +
                        "<input disabled='false' type='text' style='width:50px;' value='0' id='productCount_"+data+"'></input><a href='#' onclick=\"deduceProduct(event,'" + data + "')\"><i class='ace-icon glyphicon glyphicon-minus red'></i></a></div>";
                }}
            ]
        }
    );
}

function addProduct(event,goodsCode) {
    var e = event;
    $("#productCount_" + goodsCode).val(parseInt($("#productCount_" + goodsCode).val())+1);
    e.preventDefault();
}

function deduceProduct(event,goodsCode) {
    var e = event,
    count = $("#productCount_" + goodsCode).val();
    if(parseInt(count)>0) {
        $("#productCount_" + goodsCode).val(count - 1);
    }
    e.preventDefault();
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
                {"data":"contactName","searchable":false,orderable:false},
                {"data":"address","searchable":false,orderable:false},
                {"data":"totalPrice","searchable":false},
                {"data":"sendDate","searchable":false},
                {"data":"dateCreated","searchable":false},
                {"data":"orderStatus","searchable":false,ordable:false},
                {"data":"orderSource","searchable":false,ordable:false},
                {"data":"code","searchable":false,render:function(data, type, row){
                    return "<button class='btn btn-success btn-block' onclick='cancelOrder(\""+data+"\")'>取消</button>";
                }},
                {"data":"code","searchable":false,render:function(data, type, row){
                    return "<button class='btn btn-success btn-block' onclick='addRemark(\""+data+"\")'>修改备注</button>";
                }},
                {"data":"code","searchable":false,render:function(data, type, row){
                    return "<button class='btn btn-success btn-block' onclick='showOrder(\""+data+"\")'>详情</button>";
                }},
                {"data":"code","searchable":false,render:function(data, type, row){
                    return "<button class='btn btn-success btn-block' onclick='print(\""+data+"\")'>打印页面</button>";
                }}
            ]
        });
}

function print(orderCode) {
    location.href = getApplicationContext() + "/admin/order/print?orderCode=" + orderCode;
}

function addRemark(orderCode) {

    $.getJSON(getApplicationContext() + "/admin/order/getRemark", {orderCode: orderCode}, function (data) {
        $("#add-remark-text-area").val(data.data);
        $("#add-remark-dialog").dialog("open");
    });

    $("#add-remark-order-code").val(orderCode);

}


function showOrder(orderCode) {
    $.getJSON(getApplicationContext() + "/admin/order/get", {code: orderCode}, function (data) {
        $("#view-order-phone").html(data.data.phone);
        $("#view-order-username").html(data.data.contactName);
        $("#view-order-address").html(data.data.address);
        $("#view-order-send-time").html(data.data.sendDate);
        $("#view-order-remark").html(data.data.remark);
        $("#view-order-status").html(data.data.orderStatus);
        $("#view-order-source").html(data.data.orderSource);
        $("#view-order-total-price").html(data.data.totalPrice);
        var orderItemDtoList = data.data.orderItemDtoList,
            orderItemResult = '';

        for(var i=0;i<orderItemDtoList.length;i++) {
            var orderItem = orderItemDtoList[i];
            orderItemResult += "<li class='item-orange clearfix'>"+ orderItem.goodsName+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+orderItem.count+"份"+
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+orderItem.totalPrice +"元</li>"
        }

        $("#view-goods-list").html(orderItemResult);

        $("#order-detail-dialog").dialog("open");
    });


}

function cancelOrder(orderCode) {
    $.getJSON(getApplicationContext()+"/admin/order/cancelOrder",
        {code:orderCode},
            function(data){
                $("#order-table").dataTable().fnDestroy();
                initOrderTable("order-table");
                window.location.reload();
        }
    );

}

function changeMemberInfo(specifiedField) {
    if(specifiedField == 'memberAddress'){
        if($("#change-member-contract-address").val()=='false' || !$("#change-member-contract-address").val()){
            $("#change-member-contract-address").val('true');
            $("#change-member-contract-address").prev().attr("class","blue");
        }
        else {
            $("#change-member-contract-address").val('false');
            $("#change-member-contract-address").prev().attr("class","");
        }
    }
    else {
        if($("#change-member-contract-name").val()=='false' || !$("#change-member-contract-name").val()){
            $("#change-member-contract-name").val('true');
            $("#change-member-contract-name").prev().attr("class","blue");
        }
        else {
            $("#change-member-contract-name").val('false');
            $("#change-member-contract-name").prev().attr("class","");
        }
    }
}


function showPrintAllPages(){
    location.href=getApplicationContext()+"/admin/order/print?printAll=true";
}
