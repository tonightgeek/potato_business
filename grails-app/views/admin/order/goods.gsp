
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>嘟嘟管理平台--订单管理</title>
    <meta name="layout" content="adminlayout">
    <asset:javascript src="admin/goods.js"></asset:javascript>
</head>
<body>
<div class="page-header">
    <button class="btn btn-primary" id="add-goods">
        添加商品
    </button>
</div>
<div class="row">
    <div class="col-xs-12">
        <div id="sample-table-2_wrapper" class="dataTables_wrapper form-inline no-footer">
            <div class="row" >
                <div class="col-xs=12">

                    <button class="btn btn-primary btn-sm" id="search-table-button">搜索</button>
                </div>
            </div>
            <table id="goods-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="sample-table-2_info">
                <thead>
                <tr>
                    <th>商品编号</th>
                    <th>商品名</th>
                    <th>销售价格</th>
                    <th>商品状态</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<div title="增加商品" id="addGoodsDialog" style="display: none;">
    <form action="${request.contextPath}/goods/save" enctype="multipart/form-data" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="goods-names-input">商品名称</label>
            <div class="col-sm-9">
                <input type="text" id="goods-names-input" placeholder="商品名" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="goods-sales-input">商品价格</label>
            <div class="col-sm-6">
                <input type="text" id="goods-sales-input" placeholder="商品价格" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="goods-description-input">商品介绍</label>
            <div class="col-sm-6">
                <input type="text" id="goods-description-input" placeholder="商品介绍" class="col-sm-12"></input>
            </div>
        </div>

    </form>
</div>

</body>
</html>