'use strict';

/* Controllers */

function AppCtrl($scope, $http) {
  // $http({method: 'GET', url: '/api/name'}).
  // success(function(data, status, headers, config) {
  //   $scope.name = data.name;
  // }).
  // error(function(data, status, headers, config) {
  //   $scope.name = 'Error!'
  // });

}

angular.module('myApp').controller('FlushCtrl', ['$scope', '$http', 'geolocation',
  function($scope, $http, geolocation) {

  $scope.flushState = 'start';
  $scope.flush = function() {
    $scope.flushState = 'flushProcessing';
    $scope.coords = geolocation.getLocation().then(function(data){
      console.log(data);
      $http({method: 'GET', url: '/api/watershed',
             params: {latitude: data.coords.latitude,
                      longitude: data.coords.longitude}
            }).
      success(function(data, status, headers, config) {
        $scope.watershed = data.watershed;
        console.log("got watershed " + data.watershed);
        $scope.showResults();
        console.log("state is " + $scope.flushState);
      }).
      error(function(data, status, headers, config) {
        console.log("failed to get watershed");
        $scope.watershed = 'Error!'
        $scope.flushState = 'start';
      });
    });
  };
  $scope.showResults = function() {
        $scope.flushState = 'flushResults';
  };
}]);

