
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
            %{--<div class="row" >--}%
                %{--<div class="col-xs=12">--}%
                %{--</div>--}%
            %{--</div>--}%
            <table id="goods-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="sample-table-2_info">
                <thead>
                <tr>
                    <th>商品编号</th>
                    <th>商品名</th>
                    <th>基础价格</th>
                    <th>商品状态</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>

<div title="增加商品" id="addGoodsDialog" style="display: none;">
    <form method="post" action="${request.contextPath}/admin/goods/save" enctype="multipart/form-data" class="form-horizontal" id="goods-save-form">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="goods-names-input">商品名称</label>
            <div class="col-sm-9">
                <input type="text" name="names" id="goods-names-input" placeholder="商品名" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="goods-base-price">商品价</label>
            <div class="col-sm-6">
                <input type="text" name="basePrice" id="goods-base-price" placeholder="商品价格" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="goods-sales-price">微信销售价</label>
            <div class="col-sm-6">
                <input type="text" name="salePrice" id="goods-sales-price" placeholder="微信销售价" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="goods-description-input">商品介绍</label>
            <div class="col-sm-8">
                <textarea style="height: 100px;" name="description" class="form-control" id="goods-description-input"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="goods-inventory-input">商品库存</label>
            <div class="col-sm-8">
                <input type="text" name="inventory" class="form-control" value="0" id="goods-inventory-input"></input>
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="goods-image">商品照片</label>

            <div class="col-sm-8">
                <input type="file" name="file" id="goods-image" class="form-control"/>
                %{--<label class="ace-file-input">--}%

                    %{--<span class="ace-file-name" data-title="商品图片">--}%
                        %{--<i class=" ace-icon fa fa-upload"></i>--}%
                    %{--</span>--}%
                %{--</label>--}%
            </div>
        </div>
    </form>
</div>


<div title="编辑商品" id="edit-goods-dialog" style="display: none;">
    <form method="post" action="${request.contextPath}/admin/goods/update" enctype="multipart/form-data" class="form-horizontal" id="goods-edit-form">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="edit-goods-name">商品名称</label>
            <div class="col-sm-9">
                <input type="text" name="names" id="edit-goods-name" placeholder="商品名" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="edit-goods-price">商品价</label>
            <div class="col-sm-6">
                <input type="text" name="basePrice" id="edit-goods-price" placeholder="商品价格" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="edit-goods-sales-price">微信销售价</label>
            <div class="col-sm-6">
                <input type="text" name="salePrice" id="edit-goods-sales-price" placeholder="微信销售价" class="col-sm-12"></input>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="edit-goods-description">商品介绍</label>
            <div class="col-sm-8">
                <textarea style="height: 100px;" name="description" class="form-control" id="edit-goods-description"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="edit-goods-inventory">商品库存</label>
            <div class="col-sm-8">
                <input type="text" name="inventory" class="form-control" id="edit-goods-inventory"></input>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right">商品状态</label>
            <div class="col-sm-8">
                <button class="btn btn-warning" data-toggle="button" id="status_on_sale" onclick="changeGoodStatus(this)">在售</button>
                <button class="btn btn-warning" data-toggle="button" id="status_off_sale" onclick="changeGoodStatus(this)">下架</button>
                <button class="btn btn-warning" data-toggle="button" id="status_over_sale" onclick="changeGoodStatus(this)">售罄</button>
            </div>
            <input type="hidden" id="editGoodsStatus" name="goodsStatus"/>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="edit-goods-image">商品照片</label>

            <div class="col-sm-8">
                <input type="file" name="file" id="edit-goods-image" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-8" style="text-align: center;">
                <img src="" id="edit-goods-img-path"/>
            </div>
        </div>
        <input type="hidden" id="edit-goods-code" name="code"/>
    </form>
</div>

</body>
</html>