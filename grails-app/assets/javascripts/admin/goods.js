$(document).ready(
    function() {
        $("#goods-save-form").ajaxForm();
        $("#goods-edit-form").ajaxForm();

        initTable("goods-table");
        $("#add-goods").click(
            function() {
                $("#goods-names-input").val("");
                $("#goods-sales-input").val("");
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
                {"data":"price","searchable":false,orderable:false},
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

function editGoods(code) {
    $("#edit-goods-code").val(code);
    clearElementsValue(['edit-goods-name','edit-goods-price','edit-goods-description']);
    $.ajax({
            url:getApplicationContext()+"/admin/goods/get",
            data:{code:code},
            async:false,
            success:function(data) {
                setElementsValue(['edit-goods-name','edit-goods-price','edit-goods-description'],[data.data.goodName,data.data.price,
                data.data.description]);
                $("#edit-goods-img-path").attr("src", getApplicationContext()+'/'+data.data.iconPath);
                if(data.data.status == 'ON_SALE')
                {
                    $("#edit-status-div").html("<label><input name='goodsStatus' " +
                    "id='edit-goods-status' class=\"ace ace-switch ace-switch-5\" type=\"checkbox\" checked=\"checked\" value=\"true\"></input> " +
                    "<span class=\"lbl\"></span> </label>");
                }
                else {
                    $("#edit-status-div").html("<label><input name=\"goodsStatus\" " +
                    "id=\"edit-goods-status\" class=\"ace ace-switch ace-switch-5\" type=\"checkbox\" value=\"true\"></input> " +
                    "<span class=\"lbl\"></span> </label>");
                }

                $("#edit-goods-dialog").dialog({
                    modal:true,
                    width:500,
                    buttons:[{
                        text:"修改商品",
                        click:function() {
                            $("#goods-edit-form").ajaxSubmit({
                                success:function(data) {
                                    if(data.result.name=="SUCCESS"){
                                        $("#edit-goods-dialog").dialog("close");
                                        $("#goods-table").dataTable().fnDestroy();
                                        initTable("goods-table");
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