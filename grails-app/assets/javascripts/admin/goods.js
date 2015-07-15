$(document).ready(
    function() {
        $("#goods-save-form").ajaxForm();
        $("#goods-edit-form").ajaxForm();

        initTable("goods-table");
        $("#add-goods").click(
            function() {
                $("#goods-names-input").val("");
                $("#goods-sales-price").val("");
                $("#goods-base-price").val("");
                $("#goods-description-input").val("");
                $("#addGoodsDialog").dialog(
                    {
                        modal:true,
                        width:500,
                        buttons:[{
                            text:"保存数据",
                            click:function() {
                                $("#goods-save-form").ajaxSubmit({
                                    success:function(data) {
                                        if(data=="success"){
                                            $("#addGoodsDialog").dialog("close");
                                            location.reload();
                                        }
                                        else {
                                            alert("保存数据异常，重新尝试");
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
                    }
                );
            }
        );

        activeMenu("goods-menu-li");
    }
);


function initTable(tableId) {
    $("#"+tableId).on('preXhr.dt', function ( e, settings, data ) {
        } )
        .dataTable({
            "serverSide":true,
            "searching":false,
            "ajax": {
                "url":getApplicationContext()+"/admin/goods/list"
            },
            "columns":[
                {"data":"goodsCode","searchable":false,orderable:false},
                {"data":"goodName","searchable":false,orderable:false},
                {"data":"basePrice","searchable":false,orderable:false},
                {"data":"status","searchable":false,orderable:false},
                {"data":"goodsCode","searchable":false,orderable:false,render:function(data, type, row){
                    return "<button class='btn btn-primary btn-sm' onclick=\"editGoods('"+data+"')\">编辑</button>";
                }},
                {"data":"goodsCode","searchable":false,orderable:false,render:function(data, type, row){
                    if(row.status == '下架'){
                        return "<button class='btn btn-primary btn-sm' onclick=\"onsale('"+data+"')\">上架</button>";
                    }else {
                        return "<button class='btn btn-primary btn-sm' onclick=\"offGoods('"+data+"')\">下架</button>";
                    }
                }}
            ]
        });
}

function changeGoodStatus(element) {
    var elements = ['status_on_sale','status_off_sale','status_over_sale'];
    //if($(element).hasClass("active")){
    //    $(element).attr("aria-pressed", false);
    //    $(element).removeClass("active");
    //}else {
    //    $(element).attr("aria-pressed", true);
    //    $(element).addClass("active");
    //}
    for(var i = 0;i<elements.length;i++) {
        var eleId = elements[i];
        if(eleId != $(element).attr("id")){
            $("#"+ eleId).attr("aria-pressed", false);
            if($("#"+ eleId).hasClass("active")){
                $("#"+ eleId).removeClass("active");
            }


        }
    }
}

function editGoods(code) {
    $("#edit-goods-code").val(code);
    clearElementsValue(['edit-goods-name','edit-goods-price','edit-goods-description','edit-goods-sales-price']);
    $.ajax({
            url:getApplicationContext()+"/admin/goods/get",
            data:{code:code},
            async:false,
            success:function(data) {
                setElementsValue(['edit-goods-name','edit-goods-price','edit-goods-description','edit-goods-sales-price'],[data.data.goodName,data.data.basePrice,
                data.data.description,data.data.salePrice]);
                $("#status_on_sale").attr("aria-pressed", false);
                $("#status_on_sale").removeClass("active");
                $("#status_off_sale").attr("aria-pressed", false);
                $("#status_off_sale").removeClass("active");
                $("#status_over_sale").attr("aria-pressed", false);
                $("#status_over_sale").removeClass("active");
                $("#edit-goods-img-path").attr("src", getApplicationContext()+'/'+data.data.iconPath);
                if(data.data.status == '在售')
                {
                    $("#status_on_sale").attr("aria-pressed", true);
                    $("#status_on_sale").addClass("active");
                }
                else if(data.data.status == '下架'){
                    $("#status_off_sale").attr("aria-pressed", true);
                    $("#status_off_sale").addClass("active");
                }
                else if(data.data.status == '售罄'){
                    $("#status_over_sale").attr("aria-pressed", true);
                    $("#status_over_sale").addClass("active");
                }

                $("#edit-goods-dialog").dialog({
                    modal:true,
                    width:500,
                    buttons:[{
                        text:"修改商品",
                        click:function() {

                            if($("#status_on_sale").attr("aria-pressed") == "true") {
                                $("#editGoodsStatus").val("ON_SALE");
                            }else if($("#status_off_sale").attr("aria-pressed") == "true") {
                                $("#editGoodsStatus").val("OFF_SALE");
                            }else if($("#status_over_sale").attr("aria-pressed") == "true") {
                                $("#editGoodsStatus").val("OVER_SALE");
                            }

                            $("#goods-edit-form").ajaxSubmit({
                                success:function(data) {
                                    if(data.result.name=="SUCCESS"){
                                        $("#edit-goods-dialog").dialog("close");
                                        location.reload()
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
            },
            error:function() {
                alert("error");
            }
        }
    );

}

function offGoods(goodCode) {
    $.getJSON(getApplicationContext()+"/admin/goods/offGoods",{code:goodCode},function(data) {
        location.reload()
    });
}

function onsale(goodCode) {
    $.getJSON(getApplicationContext()+"/admin/goods/onsale",{code:goodCode},function(data) {
        location.reload()
    });
}