function getRootPath() {
    angular.element("#applicationContext").val();
}

function isMobile(v) {
    return (/^(?:13\d|15[0-9]|18[0-9]|14[0-9]|17[0-9])-?\d{5}(\d{3}|\*{3})$/.test(v));
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
                .when("/success", {
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
            $scope.sendtimeerror = false;
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

    $scope.validMobile = function () {
        if(!isMobile(angular.element("#mobile").val())) {
            $scope.mobileerror = true;
        }
        else {
            $scope.mobileerror = false;
        }
    };

    $scope.validUsername = function () {
        var username = angular.element("#username").val();
        if(username.length < 1) {
            $scope.usernameerror = true;
        }
        else {
            $scope.usernameerror = false;
        }
    };

    $scope.validAddress = function () {
        var address = angular.element("#address").val();
        if(address.length < 1) {
            $scope.addresserror = true;
        }
        else {
            $scope.addresserror = false;
        }
    };



    $scope.submitOrder = function() {
        var mobile = angular.element("#mobile").val(),
            canSubmit = true;

        if(!isMobile(mobile)) {
            canSubmit=false;
            $scope.mobileerror = true;
        }
        else {
            $scope.mobileerror = false;
        }

        var username = angular.element("#username").val();
        if(username.length < 1) {
            canSubmit=false;
            $scope.usernameerror = true;
        }
        else {
            $scope.usernameerror = false;
        }

        var address = angular.element("#address").val();
        if(address.length < 1) {
            canSubmit=false;
            $scope.addresserror = true;
        }
        else {
            $scope.addresserror = false;
        }

        var sendTime = angular.element("#time-value").html();
        if(sendTime == '配送时间') {
            canSubmit=false;
            $scope.sendtimeerror = true;
        }
        else {
            $scope.sendtimeerror = false;
        }

        if(!canSubmit){
            //event.preventDefault();
            return;
        }

        var remark = angular.element("#order-remark").val();

        $http({method : 'POST', params:{orderContract:username,orderMobile:mobile,orderAddress:address,orderSendTime:sendTime
            ,goodsCodes:$routeParams.goodsCode,goodsCount:$routeParams.goodsCount,orderRemark:remark},
            url :  applicationContext+"/homepage/createorder"})
            .success(function(data, status, headers, config){
                if(data.result.name == 'SUCCESS'){
                    if(data.data == true){
                        $location.path(url+"/success");
                    }
                }
            })
            .error(function(data, status, headers, config){
                alert("下单失败,请重新尝试!");
            });

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

