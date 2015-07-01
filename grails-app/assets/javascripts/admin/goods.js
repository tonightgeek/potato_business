$(document).ready(
    function() {
        initTable("goods-table");
        $("#add-goods").click(
            function() {
                $("#addGoodsDialog").dialog(
                    {
                        modal:true,
                        width:500
                    }
                );
            }
        );

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
            ]
        });
}

function saveGoods() {

}
