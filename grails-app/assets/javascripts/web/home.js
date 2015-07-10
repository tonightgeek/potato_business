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
        //)
                //.when("/success", {
                //    controller: 'successController',
                //    templateUrl:'./success.html',
                //    reloadOnSearch:true
                //})
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

app.controller("homeController", function ($scope,$routeParams,$http,applicationContext) {
    //$http({method : 'POST', params:null, url :  getRootPath()+"/getUserFromSession"})
    //    .success(function(data, status, headers, config){
    //        //if(data.code==1){
    //            //var msg = data.data.idachu;
    //            //if(msg){
    //            //    $("#time").html(msg.time);
    //            //    $("#rtime").val(msg.time);
    //            //    $scope.name = msg.name;
    //            //    $scope.memo = msg.memo;
    //            //    $scope.city = msg.city;
    //            //    $scope.community = msg.community;
    //            //    $scope.doorNumber = msg.doorNumber;
    //            //    $scope.tel = msg.tel;
    //            //    $scope.mile = msg.mile;
    //            //    var pa = msg.packages;
    //            //    $("#packages").val(pa);
    //            //    if(pa == "四菜/69元（建议两人用餐）"){
    //            //        $scope.reservePackage(1);
    //            //    }
    //            //    else if(pa == "六菜/99元（建议四人用餐）"){
    //            //        $scope.reservePackage(2);
    //            //    }
    //            //    else if(pa == "八菜/129元（建议六人用餐）"){
    //            //        $scope.reservePackage(3);
    //            //    }
    //            //}
    //            //if(data.data.userCode){
    //            //    userMail = data.data.userCode;
    //            //}
    //        //}
    //    })
    //    .error(function(data, status, headers, config){
    //    });
});

