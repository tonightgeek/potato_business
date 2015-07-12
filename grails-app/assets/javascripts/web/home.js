function getRootPath() {
    angular.element("#applicationContext").val();
}

var app = angular.module('main',['ngRoute']);

app.config(function($routeProvider) {

        $routeProvider
            .when("/home", {
                    controller: 'homeController',
                    templateUrl:'../html/index.html',
                    reloadOnSearch:true
                })
                .when("/order/:goodsCode/:goodsCount", {
                    controller: 'orderController',
                    templateUrl:'../html/confirmorder.html',
                    reloadOnSearch:true
                })
                .otherwise(
                    {redirectTo:"/home"}
                )
    }
);

app.constant('applicationContext',
    (
        function(){
            return angular.element("#applicationContext").val();
        }
    )()
);

app.controller("orderController", function ($scope,$routeParams,$http,applicationContext,$location) {
    $scope.needcandy = false;
    $scope.neednapkin = false;
    $('#send-time').mobiscroll().time({
        theme: 'ios',
        mode: 'scroller',
        display: 'bottom',
        lang: 'zh',
        onSelect: function(data){
            $scope.selectedDate = data;
            if(data.length > 0) {
                angular.element("#time-value").html(data);
                angular.element("#time-value").css("color", "#1e1e1e");
            }
        }

    });

    $http({method : 'GET', params:{goodscode:$routeParams.goodsCode,goodscount:$routeParams.goodsCount},
        url :  applicationContext+"/homepage/startorder"})
        .success(function(data, status, headers, config){
            if(data.result.name == 'SUCCESS'){
                $scope.orderdetail = data.data
            }
        })
        .error(function(data, status, headers, config){
        });

    $scope.validMobile = function (element) {
        var mobile = angular.element("#mobile").val();
        alert(mobile.length);
        if(mobile.length < 11) {
            $scope.mobileerror = true;
        }
        else {
            $scope.mobileerror = false;
        }

    };

    $scope.changeNeedCandy = function() {
        $scope.needcandy = !$scope.needcandy;
    };

    $scope.changeNeedNapkin = function(){
        $scope.neednapkin = !$scope.neednapkin;
    }
});

app.controller("homeController", function ($scope,$routeParams,$http,applicationContext,$location) {
    $http({method : 'GET', params:null, url :  applicationContext+"/homepage/listgoods"})
        .success(function(data, status, headers, config){
            if(data.result.name == 'SUCCESS'){
                $scope.goodslist = data.data;
                angular.forEach(data.data,function(good) {
                    good.iconPath = applicationContext + "/" +good.iconPath;
                    good.orderCount = 0;
                })
            }
        })
        .error(function(data, status, headers, config){
        });
    $scope.addGood = function(goodCode) {
        angular.forEach($scope.goodslist,function(data) {
            if(data.goodsCode == goodCode) {
                data.orderCount += 1;
                return;
            }
        });
    };

    $scope.deduceGood = function(goodCode) {
        angular.forEach($scope.goodslist,function(data) {
            if(data.goodsCode == goodCode) {
                if(data.orderCount>0) {
                    data.orderCount -= 1;
                    return;
                }
            }
        });
    };

    $scope.startOrder = function() {
        var url = "/order",goodsCount='',goodsCode='';
        angular.forEach($scope.goodslist, function (data) {
            if(parseInt(data.orderCount) > 0) {
                goodsCount += data.orderCount + ",";
                goodsCode += data.goodsCode + ",";
            }
        });


        if(goodsCount.trim().length >1) {
            goodsCount = goodsCount.substr(0, goodsCount.length - 1);
            goodsCode = goodsCode.substr(0, goodsCode.length - 1);
        }
        $location.path(url+"/"+goodsCode+"/"+goodsCount);
    };
});

