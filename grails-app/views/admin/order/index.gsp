
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>嘟嘟管理平台--订单管理</title>
    <meta name="layout" content="adminlayout">
    <asset:javascript src="admin/order.js"></asset:javascript>
</head>
<body>
    <div class="page-header" style="">
        <button class="btn btn-primary" onclick="openCreateOrderDialog()">
            创建订单
        </button>
        <g:if test="${needPrintCount>0}">
            <button class="btn btn-primary" onclick="showPrintAllPages()">
                ${needPrintCount}个订单未打印
            </button>
        </g:if>
        <span class="pull-right" style="padding-right: 7px;line-height: 50px;font-size: 20px;color: red;" id="orderReminder">

        </span>
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
                                <input id="orderTimeEnd" style="width:100px;" class="form-control" style="width:100px;" type="text" placeholder="" ></input>
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
                            <th>订单序号</th>
                            <th>联系人</th>
                            <th>联系地址</th>
                            <th>联系电话</th>
                            <th>总价</th>
                            <th>配送时间</th>
                            <th>订单状态</th>
                            <th>订单来源</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>

<div title="创建订单" id="create-order-dialog" style="display: none;">
    <form method="post" action="${request.contextPath}/admin/order/save" class="form-horizontal" id="goods-create-form">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="create-order-order-phone">联系电话</label>
            <div class="col-sm-6">
                <input type="text" name="orderPhone" id="create-order-order-phone" placeholder="联系电话" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="create-order-order-contact">联系人</label>
            <div class="col-sm-6">
                <input type="text" name="orderContact" id="create-order-order-contact" placeholder="联系人" class="col-sm-12"></input>
            </div>
            <div class="col-sm-3 pull-right" style="padding-top: 7px;">
                <a href="#">
                    <i class="ace-icon fa fa-pencil bigger-130" onclick="changeMemberInfo('memberContract')"></i>
                </a>
                <input type="hidden" id="change-member-contract-name" name="shouldChangeMemberName" value="false"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="create-order-order-address">配送地址</label>
            <div class="col-sm-6">
                <input type="text" name="orderAddress" id="create-order-order-address" placeholder="配送地址" class="col-sm-12"></input>
            </div>
            <div class="col-sm-3 pull-right" style="padding-top: 7px;">
                <a href="#">
                    <i class="ace-icon fa fa-pencil bigger-130" onclick="changeMemberInfo('memberAddress')"></i>
                </a>
                <input type="hidden" id="change-member-contract-address" name="shouldChangeMemberAddress" value="false"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="create-order-send-time">配送时间</label>
            <div class="col-sm-6">
                <input type="text" name="time" id="create-order-send-time" placeholder="配送时间" class="col-sm-12"></input>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" for="create-order-remark">订单备注</label>
            <div class="col-sm-6">
                <textarea style="height: 100px;" name="remark" class="form-control" id="create-order-remark"></textarea>
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
        <div id="ordersHiddenDiv"></div>
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



<div title="修改备注" id="add-remark-dialog" style="display: none;">
    <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right" for="add-remark-text-area">订单备注</label>
        <textarea style="height: 300px;" class="form-control" id="add-remark-text-area"></textarea>
    </div>
    <input type="hidden" id="add-remark-order-code"/>
</div>

<div title="订单详情" id="order-detail-dialog" style="display: none;">
        <div class="row">
            <label class="col-sm-3 control-label no-padding-right">联系电话</label>
            <span class="col-sm-6 green" id="view-order-phone">
                18621607094
            </span>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label no-padding-right">联系人</label>
            <span class="col-sm-6 green" id="view-order-username">
                孙明辉
            </span>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label no-padding-right">配送地址</label>
            <span class="col-sm-6 green" id="view-order-address">
                孙明辉
            </span>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label no-padding-right">配送时间</label>
            <span class="col-sm-6 green" id="view-order-send-time">
                孙明辉
            </span>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label no-padding-right">订单备注</label>
            <span class="col-sm-6 green" id="view-order-remark">
            </span>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label no-padding-right">订单状态</label>
            <span class="col-sm-6 green" id="view-order-status">
            </span>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label no-padding-right">订单来源</label>
            <span class="col-sm-6 green" id="view-order-source">
            </span>
        </div>
        <div class="row">
            <label class="col-sm-3 control-label no-padding-right">订单总价</label>
            <span class="col-sm-6 green" id="view-order-total-price">
            </span>
        </div>
        <div class="col-sm-12 widget-box">
            <div class="widget-header widget-header-flat widget-header-small">
                <h5 class="widget-title">商品列表</h5>
            </div>
            <div class="widget-body">
                <div class="widget-main">
                    <ul class="item-list" id="view-goods-list">
                    </ul>
                </div>
            </div>
        </div>
</div>

</body>
</html>