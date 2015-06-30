
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
                                <input id="orderTimeEnd" style="width:100px;" class="form-control" style="width:100px;" type="text" placeholder="" ></input>
                                <div id="orderTimeEndDatePicker" style="position: absolute;z-index:1000"></div>
                        </label>

                        <button class="btn btn-primary btn-sm">搜索</button>
                    </div>
                </div>
                <table id="order-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="sample-table-2_info">
                    <thead>
                        <tr>
                            <th>订单号</th>
                            <th>联系人</th>
                            <th>联系地址</th>
                            <th>总价</th>
                            <th>上门时间</th>
                            <th>下单时间</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>

</body>
</html>