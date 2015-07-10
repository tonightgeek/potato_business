
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="weblayout">
</head>

<body>
<ng-view></ng-view>
<input type="hidden" id="applicationContext" value="${request.contextPath}"/>
<asset:javascript src="web/home.js"></asset:javascript>
</body>
</html>