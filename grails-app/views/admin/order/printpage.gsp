<html>
<head>
    <title></title>
    <style type="text/css">

        body {
            font-size: 6px;
        }

        .orderdisplay {
            border-bottom: 1px solid #000000;
            padding-right: 20px;
            margin-right: 20px;
            padding-top: 5px;
        }

        .orderdisplay div {
            padding-bottom: 5px;
        }

        .orderdisplay span:last-child {
            display: inline-block;
            margin-left: 10px;
        }

        .orderdisplay span:first-child{
            display: inline-block;
            width: 80px;
        }

        .orderItem {
            padding-top: 5px;

        }

        .orderItem::before{
            content: '商品列表';
        }

        .orderItem div {
            padding-top: 5px;
            padding-left: 20px;
        }

        .orderItem span:first-child {
            width: auto;
        }

        .orderItem span {
            margin-left: 15px;
        }
    </style>
</head>

<body>
    <g:each in="${orderList}" status="i" var="order">
        <div class="orderdisplay">
            <div>
                <span>订单序号:</span><span>${order.orderSeries}</span>
            </div>
            <div>
                <span>联系人:</span><span>${order.contactName}</span>
            </div>
            <div>
                <span>联系电话:</span><span>${order.phone}</span>
            </div>
            <div>
                <span>配送地址:</span><span>${order.address}</span>
            </div>
            <div>
                <span>送达时间:</span><span>${order.sendDate}</span>
            </div>
            <div>
                <span>订单备注:</span><span>${order.remark}</span>
            </div>
            <div>
                <span>订单总价:</span><span>${order.totalPrice}</span>
            </div>
            <div>
                <span>订单来源:</span><span>${order.orderSource}</span>
            </div>
            <div>
                <span>订单号:</span><span>${order.code}</span>
            </div>
            <div class="orderItem">
                <g:each in="${order.orderItemDtoList}" var="orderItem">
                    <div>
                        <span>商品名: ${orderItem.goodsName}</span>
                        <span>购买数: ${orderItem.count}</span>
                        <span>总价: ${orderItem.totalPrice}</span>
                    </div>
                </g:each>
            </div>
        </div>
    </g:each>
</body>
</html>