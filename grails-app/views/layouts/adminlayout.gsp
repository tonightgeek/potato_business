
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>Dashboard - Ace Admin</title>

    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <asset:stylesheet href="ace/css/bootstrap.css" ></asset:stylesheet>
    <asset:stylesheet href="ace/css/font-awesome.css"></asset:stylesheet>

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <asset:stylesheet href="ace/css/ace-fonts.css"></asset:stylesheet>

    <!-- ace styles -->
    <asset:stylesheet href="ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"></asset:stylesheet>

    <!--[if lte IE 9]>
        <asset:stylesheet href="ace/css/ace-part2.css" class="ace-main-stylesheet"></asset:stylesheet>
    <![endif]-->

    <!--[if lte IE 9]>
        <asset:stylesheet href="ace/css/ace-ie.css"></asset:stylesheet>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->
    <asset:javascript src="ace/js/ace-extra.js"></asset:javascript>
    <asset:javascript src="ace/js/jquery.js"></asset:javascript>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
		<asset:javascript src="ace/js/html5shiv.js"></asset:javascript>
		<asset:javascript src="ace/js/respond.js"></asset:javascript>
		<![endif]-->
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
                <a href="index.html">
                    <i class="menu-icon fa fa-tachometer"></i>
                    <span class="menu-text"> 订单管理 </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="">
                <a href="gallery.html">
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

            </div>
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->


<asset:javascript src="ace/js/bootstrap.js"></asset:javascript>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
		  <asset:javascript src="ace/js/excanvas.js"></asset:javascript>
		<![endif]-->
<asset:javascript src="ace/js/jquery-ui.custom.js"></asset:javascript>
<asset:javascript src="ace/js/jquery.ui.touch-punch.js"></asset:javascript>
<asset:javascript src="ace/js/jquery.easypiechart.js"></asset:javascript>
<asset:javascript src="ace/js/jquery.sparkline.js"></asset:javascript>
<asset:javascript src="ace/js/flot/jquery.flot.js"></asset:javascript>
<asset:javascript src="ace/js/flot/jquery.flot.pie.js"></asset:javascript>
<asset:javascript src="ace/js/flot/jquery.flot.resize.js"></asset:javascript>

<!-- ace scripts -->
<asset:javascript src="ace/js/ace/elements.scroller.js"></asset:javascript>
<asset:javascript src="ace/js/ace/elements.colorpicker.js"></asset:javascript>
<asset:javascript src="ace/js/ace/elements.fileinput.js"></asset:javascript>
<asset:javascript src="ace/js/ace/elements.typeahead.js"></asset:javascript>
<asset:javascript src="ace/js/ace/elements.wysiwyg.js"></asset:javascript>
<asset:javascript src="ace/js/ace/elements.spinner.js"></asset:javascript>
<asset:javascript src="ace/js/ace/elements.treeview.js"></asset:javascript>
<asset:javascript src="ace/js/ace/elements.wizard.js"></asset:javascript>
<asset:javascript src="ace/js/ace/elements.aside.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.ajax-content.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.touch-drag.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.sidebar.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.sidebar-scroll-1.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.submenu-hover.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.widget-box.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.settings.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.settings-rtl.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.settings-skin.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.widget-on-reload.js"></asset:javascript>
<asset:javascript src="ace/js/ace/ace.searchbox-autocomplete.js"></asset:javascript>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {
        $('.easy-pie-chart.percentage').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html',
                    {
                        tagValuesAttribute:'data-values',
                        type: 'bar',
                        barColor: barColor ,
                        chartRangeMin:$(this).data('min') || 0
                    });
        });


        //flot chart resize plugin, somehow manipulates default browser resize event to optimize it!
        //but sometimes it brings up errors with normal resize event handlers
        $.resize.throttleWindow = false;

        var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
        var data = [
            { label: "social networks",  data: 38.7, color: "#68BC31"},
            { label: "search engines",  data: 24.5, color: "#2091CF"},
            { label: "ad campaigns",  data: 8.2, color: "#AF4E96"},
            { label: "direct traffic",  data: 18.6, color: "#DA5430"},
            { label: "other",  data: 10, color: "#FEE074"}
        ]
        function drawPieChart(placeholder, data, position) {
            $.plot(placeholder, data, {
                series: {
                    pie: {
                        show: true,
                        tilt:0.8,
                        highlight: {
                            opacity: 0.25
                        },
                        stroke: {
                            color: '#fff',
                            width: 2
                        },
                        startAngle: 2
                    }
                },
                legend: {
                    show: true,
                    position: position || "ne",
                    labelBoxBorderColor: null,
                    margin:[-30,15]
                }
                ,
                grid: {
                    hoverable: true,
                    clickable: true
                }
            })
        }
        drawPieChart(placeholder, data);

        /**
         we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
         so that's not needed actually.
         */
        placeholder.data('chart', data);
        placeholder.data('draw', drawPieChart);


        //pie chart tooltip example
        var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
        var previousPoint = null;

        placeholder.on('plothover', function (event, pos, item) {
            if(item) {
                if (previousPoint != item.seriesIndex) {
                    previousPoint = item.seriesIndex;
                    var tip = item.series['label'] + " : " + item.series['percent']+'%';
                    $tooltip.show().children(0).text(tip);
                }
                $tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
            } else {
                $tooltip.hide();
                previousPoint = null;
            }

        });

        /////////////////////////////////////
        $(document).one('ajaxloadstart.page', function(e) {
            $tooltip.remove();
        });




        var d1 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.5) {
            d1.push([i, Math.sin(i)]);
        }

        var d2 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.5) {
            d2.push([i, Math.cos(i)]);
        }

        var d3 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.2) {
            d3.push([i, Math.tan(i)]);
        }


        var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
        $.plot("#sales-charts", [
            { label: "Domains", data: d1 },
            { label: "Hosting", data: d2 },
            { label: "Services", data: d3 }
        ], {
            hoverable: true,
            shadowSize: 0,
            series: {
                lines: { show: true },
                points: { show: true }
            },
            xaxis: {
                tickLength: 0
            },
            yaxis: {
                ticks: 10,
                min: -2,
                max: 2,
                tickDecimals: 3
            },
            grid: {
                backgroundColor: { colors: [ "#fff", "#fff" ] },
                borderWidth: 1,
                borderColor:'#555'
            }
        });


        $('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('.tab-content')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            //var w2 = $source.width();

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }


        $('.dialogs,.comments').ace_scroll({
            size: 300
        });


        //Android's default browser somehow is confused when tapping on label which will lead to dragging the task
        //so disable dragging when clicking on label
        var agent = navigator.userAgent.toLowerCase();
        if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
            $('#tasks').on('touchstart', function(e){
                var li = $(e.target).closest('#tasks li');
                if(li.length == 0)return;
                var label = li.find('label.inline').get(0);
                if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
            });

        $('#tasks').sortable({
                    opacity:0.8,
                    revert:true,
                    forceHelperSize:true,
                    placeholder: 'draggable-placeholder',
                    forcePlaceholderSize:true,
                    tolerance:'pointer',
                    stop: function( event, ui ) {
                        //just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
                        $(ui.item).css('z-index', 'auto');
                    }
                }
        );
        $('#tasks').disableSelection();
        $('#tasks input:checkbox').removeAttr('checked').on('click', function(){
            if(this.checked) $(this).closest('li').addClass('selected');
            else $(this).closest('li').removeClass('selected');
        });


        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });

    })
</script>

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
</body>
</html>
