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
    geolocation.getLocation().then(function(data){
      $scope.latitude = data.coords.latitude;
      $scope.longitude = data.coords.longitude;
      console.log(data);
      $http({method: 'GET', url: '/api/watershed',
             params: {latitude: data.coords.latitude,
                      longitude: data.coords.longitude}
            }).
      success(function(data, status, headers, config) {
        if (data.error) {
          $scope.showError();
        } else {
          $scope.watershed = data.watershed;
          $scope.facility = data.facility.name;
          $scope.distance = data.facility.distance.toFixed(1);
          $scope.facility_lat = data.facility.latitude;
          $scope.facility_lon = data.facility.longitude;
          console.log("got watershed " + data.watershed);
          // $scope.tweetButton = 'htmlstring' + data.watershed + 'please';
          $scope.showResults();
          console.log("state is " + $scope.flushState);          
        }
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
  $scope.showError = function() {
        $scope.flushState = 'flushFail';
  };
  $scope.restart = function() {
      $scope.flushState = 'start';
  }  
}]);

