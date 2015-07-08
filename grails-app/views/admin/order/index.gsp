
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>嘟嘟管理平台--订单管理</title>
    <meta name="layout" content="adminlayout">
    <asset:javascript src="admin/order.js"></asset:javascript>
</head>
<body>
    <div class="page-header">
        <button class="btn btn-primary">
            创建订单
        </button>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <div id="sample-table-2_wrapper" class="dataTables_wrapper form-inline no-footer">
                <div class="row" >
                    <div class="col-xs=12">
                        <label style="padding-left: 10px;">
                            下单时间
                                <input id="orderTimeStart" style="width:100px;" class="form-control input-sm" style="width:100px;" type="text" placeholder=""></input>
                                <div id="orderTimeStartDatePicker" style="position: absolute;z-index:1000"></div>
                            至
                                <input id="orderTimeEnd" style="width:100px;" class="form-control" style="width:100px;" type="text" placeholder="" ></input>;pe
                                <div id="orderTimeEndDatePicker" style="position: absolute;z-index:1000"></div>
                        </label>

                        <label style="padding-left: 10px;">
                            配送时间
                            <input id="sendTimeStart" style="width:100px;" class="form-control input-sm" style="width:100px;" type="text" placeholder=""></input>
                            <div id="sendTimeStartDatePicker" style="position: absolute;z-index:1000"></div>
                            至
                            <input id="sendTimeEnd" style="width:100px;" class="form-control" style="width:100px;" type="text" placeholder="" ></input>
                            <div id="sendTimeEndDatePicker" style="position: absolute;z-index:1000"></div>
                        </label>

                        <button class="btn btn-primary btn-sm" id="search-table-button">搜索</button>
                    </div>
                </div>
                <table id="order-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="sample-table-2_info">
                    <thead>
                        <tr>
                            <th>订单号</th>
                            <th>联系人</th>
                            <th>联系地址</th>
                            <th>总价</th>
                            <th>配送时间</th>
                            <th>下单时间</th>
                            <th>订单状态</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>

<div title="创建订单" id="create-order-dialog" style="display: none;">
    <form method="post" action="${request.contextPath}/admin/goods/save" class="form-horizontal" id="goods-edit-form">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="create-order-order-contact">联系人</label>
            <div class="col-sm-6">
                <input type="text" name="price" id="create-order-order-contact" placeholder="联系人" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="create-order-order-phone">联系电话</label>
            <div class="col-sm-6">
                <input type="text" name="price" id="create-order-order-phone" placeholder="联系电话" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="create-order-order-address">配送地址</label>
            <div class="col-sm-6">
                <input type="text" name="price" id="create-order-order-address" placeholder="配送地址" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="create-order-send-time">配送时间</label>
            <div class="col-sm-6">
                <input type="text" name="price" id="create-order-send-time" placeholder="配送时间" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="create-order-remark">订单备注</label>
            <div class="col-sm-6">
                <textarea style="height: 100px;" name="description" class="form-control" id="create-order-remark"></textarea>
            </div>
        </div>
        <div class="col-sm-12 widget-box">
            <div class="widget-header widget-header-flat widget-header-small">
                <h5 class="widget-title">商品列表</h5>
            </div>
            <div class="widget-body">
                <div class="widget-main">
                    <ul class="item-list" id="goods-list">
                    </ul>
                </div>
            </div>
        </div>
        <div id="ordersHiddenDiv">

        </div>
        <div class="col-sm-12" style="text-align: center;">
            <button class="btn btn-success btn-block" id="select-goods-button">选择商品</button>
        </div>

    </form>
</div>

<div title="选择商品" id="select-goods-dialog" style="display: none;">
    <table id="goods-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="sample-table-2_info">
        <thead>
        <tr>
            <th>商品名</th>
            <th>销售价格</th>
            <th></th>
        </tr>
        </thead>
    </table>
</div>

</body>
</html>