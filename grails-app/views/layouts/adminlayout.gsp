
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title><g:layoutTitle default="嘟嘟土豆管理平台"/></title>
    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <asset:stylesheet href="ace/css/bootstrap.css" ></asset:stylesheet>
    <asset:stylesheet href="ace/css/font-awesome.css"></asset:stylesheet>
    <asset:stylesheet href="jquery/jquery.ui.timepicker.css"></asset:stylesheet>

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <asset:stylesheet href="ace/css/ace-fonts.css"></asset:stylesheet>

    <!-- ace styles -->
    <asset:stylesheet href="ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"></asset:stylesheet>

    <!--[if lte IE 9]>
        <asset:stylesheet href="ace/css/ace-part2.css" class="ace-main-stylesheet"></asset:stylesheet>
    <![endif]-->
    <asset:stylesheet href="jquery/jquery.dataTables.min.css"></asset:stylesheet>
    <asset:stylesheet href="jquery/jquery-ui.min.css"></asset:stylesheet>

    <!-- ace settings handler -->
    <asset:javascript src="ace/js/ace-extra.js"></asset:javascript>
    <asset:javascript src="ace/js/jquery.js"></asset:javascript>


    <g:layoutHead></g:layoutHead>
</head>

<body class="no-skin">
<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default">
    %{--<script type="text/javascript">--}%
        %{--try{ace.settings.check('navbar' , 'fixed')}catch(e){}--}%
    %{--</script>--}%
    <div class="navbar-container" id="navbar-container">

        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.brand -->
            <a href="#" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    嘟嘟土豆管理平台
                </small>
            </a>
        </div>
    </div><!-- /.navbar-container -->
</div>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <!-- #section:basics/sidebar -->
    <div id="sidebar" class="sidebar  responsive">
        <script type="text/javascript">
            try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
        </script>

        <ul class="nav nav-list">
            <li class="active">
                <a href="${request.contextPath}/admin/order/index">
                    <i class="menu-icon fa fa-tachometer"></i>
                    <span class="menu-text"> 订单管理 </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="">
                <a href="${request.contextPath}/admin/goods
                /index">
                    <i class="menu-icon fa fa-picture-o"></i>
                    <span class="menu-text"> 菜品管理 </span>
                </a>

                <b class="arrow"></b>
            </li>
        </ul><!-- /.nav-list -->

        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>
    </div>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content">
                <g:layoutBody/>
            </div>
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->


<asset:javascript src="ace/js/bootstrap.js"></asset:javascript>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
		  <asset:javascript src="ace/js/excanvas.js"></asset:javascript>
		<![endif]-->
%{--<asset:javascript src="ace/js/jquery-ui.custom.js"></asset:javascript>--}%
<asset:javascript src="jquery/jquery-ui.min.js"></asset:javascript>
<asset:javascript src="jquery/jquery.form.min.js"></asset:javascript>
<asset:javascript src="jquery/jquery.dataTables.min.js"></asset:javascript>
<asset:javascript src="waiting.js"></asset:javascript>
<asset:javascript src="jquery/jquery.ui.timepicker.js"></asset:javascript>


<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<asset:stylesheet href="ace/css/ace.onpage-help.css" />
<asset:stylesheet href="ace/docs/themes/sunburst.css" />
<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<asset:javascript src="ace/js/ace/elements.onpage-help.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.onpage-help.js"></asset:javascript>
<asset:javascript src="ace/docs/js/rainbow.js"></asset:javascript>
<asset:javascript src="ace/docs/js/language/generic.js"></asset:javascript>
<asset:javascript src="ace/docs/js/language/html.js"></asset:javascript>
<asset:javascript src="ace/docs/js/language/css.js"></asset:javascript>
<asset:javascript src="ace/docs/js/language/javascript.js"></asset:javascript>
<asset:javascript src="admin/common.js"></asset:javascript>
<input type="hidden" id="applicationContext" value="${request.contextPath}"/>
</body>
</html>
