
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
                <div class="row">
                    <div class="col-xs=12">
                        <label style="padding-left: 10px;">
                            下单时间
                                <input class="form-control input-sm" style="width:100px;" type="search" placeholder=""></input>
                            至
                                <input class="form-control" style="width:100px;" type="search" placeholder=""></input>
                        </label>

                        <button class="btn btn-primary btn-sm">搜索</button>
                    </div>
                </div>
                <table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="sample-table-2_info">

                </table>
            </div>
        </div>
    </div>

</body>
</html>