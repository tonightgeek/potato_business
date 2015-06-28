
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><g:layoutTitle default="嘟嘟土豆管理平台" /></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
    body {
        padding-bottom: 40px;
    }
    .sidebar-nav {
        padding: 9px 0;
    }
    </style>
    <asset:stylesheet href="charisma/bootstrap-cerulean.css"/>
    <asset:stylesheet href="charisma/bootstrap-responsive.css"/>
    <asset:stylesheet href="charisma/charisma-app.css"/>
    <asset:stylesheet href="charisma/jquery-ui-1.8.21.custom.css"/>
    <asset:stylesheet href="charisma/fullcalendar.css"/>
    <asset:stylesheet href="charisma/fullcalendar.print.css"/>
    <asset:stylesheet href="charisma/chosen.css"/>
    <asset:stylesheet href="charisma/uniform.default.css"/>
    <asset:stylesheet href="charisma/colorbox.css"/>
    <asset:stylesheet href="charisma/jquery.cleditor.css"/>
    <asset:stylesheet href="charisma/jquery.noty.css"/>
    <asset:stylesheet href="charisma/noty_theme_default.css"/>
    <asset:stylesheet href="charisma/elfinder.min.css"/>
    <asset:stylesheet href="charisma/elfinder.theme.css"/>
    <asset:stylesheet href="charisma/jquery.iphone.toggle.css"/>
    <asset:stylesheet href="charisma/opa-icons.css"/>
    <asset:stylesheet href="charisma/uploadify.css"/>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	  <asset:javascript src="http://html5shim.googlecode.com/svn/trunk/html5.js"></asset:javascript>
	<![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">
    <g:layoutHead/>
</head>

<body>
<!-- topbar starts -->
<!-- topbar ends -->
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span2">
            <div class="well nav-collapse sidebar-nav">
                <ul class="nav nav-tabs nav-stacked main-menu">
                    <li class="nav-header hidden-tablet">Main</li>
                    <li><a class="ajax-link" href="index.html"><i class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>
                    <li><a class="ajax-link" href="ui.html"><i class="icon-eye-open"></i><span class="hidden-tablet"> UI Features</span></a></li>
                    <li><a class="ajax-link" href="form.html"><i class="icon-edit"></i><span class="hidden-tablet"> Forms</span></a></li>
                    <li><a class="ajax-link" href="chart.html"><i class="icon-list-alt"></i><span class="hidden-tablet"> Charts</span></a></li>
                    <li><a class="ajax-link" href="typography.html"><i class="icon-font"></i><span class="hidden-tablet"> Typography</span></a></li>
                    <li><a class="ajax-link" href="gallery.html"><i class="icon-picture"></i><span class="hidden-tablet"> Gallery</span></a></li>
                    <li class="nav-header hidden-tablet">Sample Section</li>
                    <li><a class="ajax-link" href="table.html"><i class="icon-align-justify"></i><span class="hidden-tablet"> Tables</span></a></li>
                    <li><a class="ajax-link" href="calendar.html"><i class="icon-calendar"></i><span class="hidden-tablet"> Calendar</span></a></li>
                    <li><a class="ajax-link" href="grid.html"><i class="icon-th"></i><span class="hidden-tablet"> Grid</span></a></li>
                    <li><a class="ajax-link" href="file-manager.html"><i class="icon-folder-open"></i><span class="hidden-tablet"> File Manager</span></a></li>
                    <li><a href="tour.html"><i class="icon-globe"></i><span class="hidden-tablet"> Tour</span></a></li>
                    <li><a class="ajax-link" href="icon.html"><i class="icon-star"></i><span class="hidden-tablet"> Icons</span></a></li>
                    <li><a href="error.html"><i class="icon-ban-circle"></i><span class="hidden-tablet"> Error Page</span></a></li>
                    <li><a href="login.html"><i class="icon-lock"></i><span class="hidden-tablet"> Login Page</span></a></li>
                </ul>
                <label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
            </div><!--/.well -->
        </div><!--/span-->
    <!-- left menu ends -->

        <noscript>
            <div class="alert alert-block span10">
                <h4 class="alert-heading">Warning!</h4>
                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
            </div>
        </noscript>

        <div id="content" class="span10">
            <!-- content starts -->


            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">Home</a> <span class="divider">/</span>
                    </li>
                    <li>
                        <a href="#">Dashboard</a>
                    </li>
                </ul>
            </div>
            <div class="sortable row-fluid">
                <a data-rel="tooltip" title="6 new members." class="well span3 top-block" href="#">
                    <span class="icon32 icon-red icon-user"></span>
                    <div>Total Members</div>
                    <div>507</div>
                    <span class="notification">6</span>
                </a>

                <a data-rel="tooltip" title="4 new pro members." class="well span3 top-block" href="#">
                    <span class="icon32 icon-color icon-star-on"></span>
                    <div>Pro Members</div>
                    <div>228</div>
                    <span class="notification green">4</span>
                </a>

                <a data-rel="tooltip" title="$34 new sales." class="well span3 top-block" href="#">
                    <span class="icon32 icon-color icon-cart"></span>
                    <div>Sales</div>
                    <div>$13320</div>
                    <span class="notification yellow">$34</span>
                </a>

                <a data-rel="tooltip" title="12 new messages." class="well span3 top-block" href="#">
                    <span class="icon32 icon-color icon-envelope-closed"></span>
                    <div>Messages</div>
                    <div>25</div>
                    <span class="notification red">12</span>
                </a>
            </div>

            <div class="row-fluid">
                <div class="box span12">
                    <div class="box-header well">
                        <h2><i class="icon-info-sign"></i> Introduction</h2>
                        <div class="box-icon">
                            <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                            <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                            <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                        </div>
                    </div>
                    <div class="box-content">
                        <h1>Charisma <small>free, premium quality, responsive, multiple skin admin template.</small></h1>
                        <p>Its a live demo of the template. I have created Charisma to ease the repeat work I have to do on my projects. Now I re-use Charisma as a base for my admin panel work and I am sharing it with you :)</p>
                        <p><b>All pages in the menu are functional, take a look at all, please share this with your followers.</b></p>

                        <p class="center">
                            <a href="http://usman.it/free-responsive-admin-template" class="btn btn-large btn-primary"><i class="icon-chevron-left icon-white"></i> Back to article</a>
                            <a href="http://usman.it/free-responsive-admin-template" class="btn btn-large"><i class="icon-download-alt"></i> Download Page</a>
                        </p>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            %{--<div class="row-fluid sortable">--}%
                %{--<div class="box span4">--}%
                    %{--<div class="box-header well">--}%
                        %{--<h2><i class="icon-th"></i> Tabs</h2>--}%
                        %{--<div class="box-icon">--}%
                            %{--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--}%
                            %{--<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>--}%
                            %{--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="box-content">--}%
                        %{--<ul class="nav nav-tabs" id="myTab">--}%
                            %{--<li class="active"><a href="#info">Info</a></li>--}%
                            %{--<li><a href="#custom">Custom</a></li>--}%
                            %{--<li><a href="#messages">Messages</a></li>--}%
                        %{--</ul>--}%

                        %{--<div id="myTabContent" class="tab-content">--}%
                            %{--<div class="tab-pane active" id="info">--}%
                                %{--<h3>Charisma <small>a fully featued template</small></h3>--}%
                                %{--<p>Its a fully featured, responsive template for your admin panel. Its optimized for tablet and mobile phones. Scan the QR code below to view it in your mobile device.</p> <img alt="QR Code" class="charisma_qr center" src="img/qrcode136.png" />--}%
                            %{--</div>--}%
                            %{--<div class="tab-pane" id="custom">--}%
                                %{--<h3>Custom <small>small text</small></h3>--}%
                                %{--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor.</p>--}%
                                %{--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare nulla. Donec consectetur, velit a pharetra ultricies, diam lorem lacinia risus, ac commodo orci erat eu massa. Sed sit amet nulla ipsum. Donec felis mauris, vulputate sed tempor at, aliquam a ligula. Pellentesque non pulvinar nisi.</p>--}%
                            %{--</div>--}%
                            %{--<div class="tab-pane" id="messages">--}%
                                %{--<h3>Messages <small>small text</small></h3>--}%
                                %{--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales at. Nulla tellus elit, varius non commodo eget, mattis vel eros. In sed ornare nulla. Donec consectetur, velit a pharetra ultricies, diam lorem lacinia risus, ac commodo orci erat eu massa. Sed sit amet nulla ipsum. Donec felis mauris, vulputate sed tempor at, aliquam a ligula. Pellentesque non pulvinar nisi.</p>--}%
                                %{--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor.</p>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</div><!--/span-->--}%

                %{--<div class="box span4">--}%
                    %{--<div class="box-header well" data-original-title>--}%
                        %{--<h2><i class="icon-user"></i> Member Activity</h2>--}%
                        %{--<div class="box-icon">--}%
                            %{--<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>--}%
                            %{--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="box-content">--}%
                        %{--<div class="box-content">--}%
                            %{--<ul class="dashboard-list">--}%
                                %{--<li>--}%
                                    %{--<a href="#">--}%
                                        %{--<img class="dashboard-avatar" alt="Usman" src="http://www.gravatar.com/avatar/f0ea51fa1e4fae92608d8affee12f67b.png?s=50"></a>--}%
                                    %{--<strong>Name:</strong> <a href="#">Usman--}%
                                %{--</a><br>--}%
                                    %{--<strong>Since:</strong> 17/05/2012<br>--}%
                                    %{--<strong>Status:</strong> <span class="label label-success">Approved</span>--}%
                                %{--</li>--}%
                                %{--<li>--}%
                                    %{--<a href="#">--}%
                                        %{--<img class="dashboard-avatar" alt="Sheikh Heera" src="http://www.gravatar.com/avatar/3232415a0380253cfffe19163d04acab.png?s=50"></a>--}%
                                    %{--<strong>Name:</strong> <a href="#">Sheikh Heera--}%
                                %{--</a><br>--}%
                                    %{--<strong>Since:</strong> 17/05/2012<br>--}%
                                    %{--<strong>Status:</strong> <span class="label label-warning">Pending</span>--}%
                                %{--</li>--}%
                                %{--<li>--}%
                                    %{--<a href="#">--}%
                                        %{--<img class="dashboard-avatar" alt="Abdullah" src="http://www.gravatar.com/avatar/46056f772bde7c536e2086004e300a04.png?s=50"></a>--}%
                                    %{--<strong>Name:</strong> <a href="#">Abdullah--}%
                                %{--</a><br>--}%
                                    %{--<strong>Since:</strong> 25/05/2012<br>--}%
                                    %{--<strong>Status:</strong> <span class="label label-important">Banned</span>--}%
                                %{--</li>--}%
                                %{--<li>--}%
                                    %{--<a href="#">--}%
                                        %{--<img class="dashboard-avatar" alt="Saruar Ahmed" src="http://www.gravatar.com/avatar/564e1bb274c074dc4f6823af229d9dbb.png?s=50"></a>--}%
                                    %{--<strong>Name:</strong> <a href="#">Saruar Ahmed--}%
                                %{--</a><br>--}%
                                    %{--<strong>Since:</strong> 17/05/2012<br>--}%
                                    %{--<strong>Status:</strong> <span class="label label-info">Updates</span>--}%
                                %{--</li>--}%
                            %{--</ul>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</div><!--/span-->--}%

                %{--<div class="box span4">--}%
                    %{--<div class="box-header well" data-original-title>--}%
                        %{--<h2><i class="icon-list-alt"></i> Realtime Traffic</h2>--}%
                        %{--<div class="box-icon">--}%
                            %{--<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>--}%
                            %{--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="box-content">--}%
                        %{--<div id="realtimechart" style="height:190px;"></div>--}%
                        %{--<p class="clearfix">You can update a chart periodically to get a real-time effect by using a timer to insert the new data in the plot and redraw it.</p>--}%
                        %{--<p>Time between updates: <input id="updateInterval" type="text" value="" style="text-align: right; width:5em"> milliseconds</p>--}%
                    %{--</div>--}%
                %{--</div><!--/span-->--}%
            %{--</div><!--/row-->--}%

            %{--<div class="row-fluid sortable">--}%
                %{--<div class="box span4">--}%
                    %{--<div class="box-header well" data-original-title>--}%
                        %{--<h2><i class="icon-list"></i> Buttons</h2>--}%
                        %{--<div class="box-icon">--}%
                            %{--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--}%
                            %{--<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>--}%
                            %{--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="box-content buttons">--}%
                        %{--<p class="btn-group">--}%
                            %{--<button class="btn">Left</button>--}%
                            %{--<button class="btn">Middle</button>--}%
                            %{--<button class="btn">Right</button>--}%
                        %{--</p>--}%
                        %{--<p>--}%
                            %{--<button class="btn btn-small"><i class="icon-star"></i> Icon button</button>--}%
                            %{--<button class="btn btn-small btn-primary">Small button</button>--}%
                            %{--<button class="btn btn-small btn-danger">Small button</button>--}%
                        %{--</p>--}%
                        %{--<p>--}%
                            %{--<button class="btn btn-small btn-warning">Small button</button>--}%
                            %{--<button class="btn btn-small btn-success">Small button</button>--}%
                            %{--<button class="btn btn-small btn-info">Small button</button>--}%
                        %{--</p>--}%
                        %{--<p>--}%
                            %{--<button class="btn btn-small btn-inverse">Small button</button>--}%
                            %{--<button class="btn btn-large btn-primary btn-round">Round button</button>--}%
                            %{--<button class="btn btn-large btn-round"><i class="icon-ok"></i></button>--}%
                            %{--<button class="btn btn-primary"><i class="icon-edit icon-white"></i></button>--}%
                        %{--</p>--}%
                        %{--<p>--}%
                            %{--<button class="btn btn-mini">Mini button</button>--}%
                            %{--<button class="btn btn-mini btn-primary">Mini button</button>--}%
                            %{--<button class="btn btn-mini btn-danger">Mini button</button>--}%
                            %{--<button class="btn btn-mini btn-warning">Mini button</button>--}%
                        %{--</p>--}%
                        %{--<p>--}%
                            %{--<button class="btn btn-mini btn-info">Mini button</button>--}%
                            %{--<button class="btn btn-mini btn-success">Mini button</button>--}%
                            %{--<button class="btn btn-mini btn-inverse">Mini button</button>--}%
                        %{--</p>--}%
                    %{--</div>--}%
                %{--</div><!--/span-->--}%

                %{--<div class="box span4">--}%
                    %{--<div class="box-header well" data-original-title>--}%
                        %{--<h2><i class="icon-list"></i> Buttons</h2>--}%
                        %{--<div class="box-icon">--}%
                            %{--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--}%
                            %{--<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>--}%
                            %{--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="box-content  buttons">--}%
                        %{--<p>--}%
                            %{--<button class="btn btn-large">Large button</button>--}%
                            %{--<button class="btn btn-large btn-primary">Large button</button>--}%
                        %{--</p>--}%
                        %{--<p>--}%
                            %{--<button class="btn btn-large btn-danger">Large button</button>--}%
                            %{--<button class="btn btn-large btn-warning">Large button</button>--}%
                        %{--</p>--}%
                        %{--<p>--}%
                            %{--<button class="btn btn-large btn-success">Large button</button>--}%
                            %{--<button class="btn btn-large btn-info">Large button</button>--}%
                        %{--</p>--}%
                        %{--<p>--}%
                            %{--<button class="btn btn-large btn-inverse">Large button</button>--}%
                        %{--</p>--}%
                        %{--<div class="btn-group">--}%
                            %{--<button class="btn btn-large">Large Dropdown</button>--}%
                            %{--<button class="btn btn-large dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>--}%
                            %{--<ul class="dropdown-menu">--}%
                                %{--<li><a href="#"><i class="icon-star"></i> Action</a></li>--}%
                                %{--<li><a href="#"><i class="icon-tag"></i> Another action</a></li>--}%
                                %{--<li><a href="#"><i class="icon-download-alt"></i> Something else here</a></li>--}%
                                %{--<li class="divider"></li>--}%
                                %{--<li><a href="#"><i class="icon-tint"></i> Separated link</a></li>--}%
                            %{--</ul>--}%
                        %{--</div>--}%

                    %{--</div>--}%
                %{--</div><!--/span-->--}%

                %{--<div class="box span4">--}%
                    %{--<div class="box-header well" data-original-title>--}%
                        %{--<h2><i class="icon-list"></i> Weekly Stat</h2>--}%
                        %{--<div class="box-icon">--}%
                            %{--<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>--}%
                            %{--<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>--}%
                            %{--<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="box-content">--}%
                        %{--<ul class="dashboard-list">--}%
                            %{--<li>--}%
                                %{--<a href="#">--}%
                                    %{--<i class="icon-arrow-up"></i>--}%
                                    %{--<span class="green">92</span>--}%
                                    %{--New Comments--}%
                                %{--</a>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                                %{--<a href="#">--}%
                                    %{--<i class="icon-arrow-down"></i>--}%
                                    %{--<span class="red">15</span>--}%
                                    %{--New Registrations--}%
                                %{--</a>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                                %{--<a href="#">--}%
                                    %{--<i class="icon-minus"></i>--}%
                                    %{--<span class="blue">36</span>--}%
                                    %{--New Articles--}%
                                %{--</a>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                                %{--<a href="#">--}%
                                    %{--<i class="icon-comment"></i>--}%
                                    %{--<span class="yellow">45</span>--}%
                                    %{--User reviews--}%
                                %{--</a>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                                %{--<a href="#">--}%
                                    %{--<i class="icon-arrow-up"></i>--}%
                                    %{--<span class="green">112</span>--}%
                                    %{--New Comments--}%
                                %{--</a>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                                %{--<a href="#">--}%
                                    %{--<i class="icon-arrow-down"></i>--}%
                                    %{--<span class="red">31</span>--}%
                                    %{--New Registrations--}%
                                %{--</a>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                                %{--<a href="#">--}%
                                    %{--<i class="icon-minus"></i>--}%
                                    %{--<span class="blue">93</span>--}%
                                    %{--New Articles--}%
                                %{--</a>--}%
                            %{--</li>--}%
                            %{--<li>--}%
                                %{--<a href="#">--}%
                                    %{--<i class="icon-comment"></i>--}%
                                    %{--<span class="yellow">254</span>--}%
                                    %{--User reviews--}%
                                %{--</a>--}%
                            %{--</li>--}%
                        %{--</ul>--}%
                    %{--</div>--}%
                %{--</div><!--/span-->--}%
            %{--</div><!--/row-->--}%




        <!-- content ends -->
        </div><!--/#content.span10-->
    </div><!--/fluid-row-->


    %{--<div class="modal hide fade" id="myModal">--}%
        %{--<div class="modal-header">--}%
            %{--<button type="button" class="close" data-dismiss="modal">×</button>--}%
            %{--<h3>Settings</h3>--}%
        %{--</div>--}%
        %{--<div class="modal-body">--}%
            %{--<p>Here settings can be configured...</p>--}%
        %{--</div>--}%
        %{--<div class="modal-footer">--}%
            %{--<a href="#" class="btn" data-dismiss="modal">Close</a>--}%
            %{--<a href="#" class="btn btn-primary">Save changes</a>--}%
        %{--</div>--}%
    %{--</div>--}%

    %{--<footer>--}%
        %{--<p class="pull-left">&copy; <a href="http://usman.it" target="_blank">Muhammad Usman</a> 2012</p>--}%
        %{--<p class="pull-right">Powered by: <a href="http://usman.it/free-responsive-admin-template">Charisma</a></p>--}%
    %{--</footer>--}%

</div>
<asset:javascript src="charisma/jquery-1.7.2.min.js"></asset:javascript>
<asset:javascript src="charisma/jquery-ui-1.8.21.custom.min.js"></asset:javascript>
<asset:javascript src="charisma/bootstrap-transition.js"></asset:javascript>
<asset:javascript src="charisma/bootstrap-alert.js"></asset:javascript>
<asset:javascript src="charisma/jquery-1.7.2.min.js"></asset:javascript>
<!-- modal / dialog library -->
<asset:javascript src="charisma/bootstrap-modal.js"></asset:javascript>
<!-- custom dropdown library -->
<asset:javascript src="charisma/bootstrap-dropdown.js"></asset:javascript>
<!-- scrolspy library -->
<asset:javascript src="charisma/bootstrap-scrollspy.js"></asset:javascript>
<!-- library for creating tabs -->
<asset:javascript src="charisma/bootstrap-tab.js"></asset:javascript>
<!-- library for advanced tooltip -->
<asset:javascript src="charisma/bootstrap-tooltip.js"></asset:javascript>
<!-- popover effect library -->
<asset:javascript src="charisma/bootstrap-popover.js"></asset:javascript>
<!-- button enhancer library -->
<asset:javascript src="charisma/bootstrap-button.js"></asset:javascript>
<!-- accordion library (optional, not used in demo) -->
<asset:javascript src="charisma/bootstrap-collapse.js"></asset:javascript>
<!-- carousel slideshow library (optional, not used in demo) -->
<asset:javascript src="charisma/bootstrap-carousel.js"></asset:javascript>
<!-- autocomplete library -->
<asset:javascript src="charisma/bootstrap-typeahead.js"></asset:javascript>
<!-- tour library -->
<asset:javascript src="charisma/bootstrap-tour.js"></asset:javascript>
<!-- library for cookie management -->
<asset:javascript src="charisma/jquery.cookie.js"></asset:javascript>
<!-- calander plugin -->
<asset:javascript src='charisma/fullcalendar.min.js'></asset:javascript>
<!-- data table plugin -->
<asset:javascript src='charisma/jquery.dataTables.min.js'></asset:javascript>

<!-- chart libraries start -->
<asset:javascript src="charisma/excanvas.js"></asset:javascript>
<asset:javascript src="charisma/jquery.flot.min.js"></asset:javascript>
<asset:javascript src="charisma/jquery.flot.pie.min.js"></asset:javascript>
<asset:javascript src="charisma/jquery.flot.stack.js"></asset:javascript>
<asset:javascript src="charisma/jquery.flot.resize.min.js"></asset:javascript>
<!-- chart libraries end -->

<!-- select or dropdown enhancer -->
<asset:javascript src="charisma/jquery.chosen.min.js"></asset:javascript>
<!-- checkbox, radio, and file input styler -->
<asset:javascript src="charisma/jquery.uniform.min.js"></asset:javascript>
<!-- plugin for gallery image view -->
<asset:javascript src="charisma/jquery.colorbox.min.js"></asset:javascript>
<!-- rich text editor library -->
<asset:javascript src="charisma/jquery.cleditor.min.js"></asset:javascript>
<!-- notification plugin -->
<asset:javascript src="charisma/jquery.noty.js"></asset:javascript>
<!-- file manager library -->
<asset:javascript src="charisma/jquery.elfinder.min.js"></asset:javascript>
<!-- star rating plugin -->
<asset:javascript src="charisma/jquery.raty.min.js"></asset:javascript>
<!-- for iOS style toggle switch -->
<asset:javascript src="charisma/jquery.iphone.toggle.js"></asset:javascript>
<!-- autogrowing textarea plugin -->
<asset:javascript src="charisma/jquery.autogrow-textarea.js"></asset:javascript>
<!-- multiple file upload plugin -->
<asset:javascript src="charisma/jquery.uploadify-3.1.min.js"></asset:javascript>
<!-- history.js for cross-browser state change on ajax -->
<asset:javascript src="charisma/jquery.history.js"></asset:javascript>
<!-- application script for Charisma demo -->
<asset:javascript src="charisma/charisma.js"></asset:javascript>


</body>
</html>
