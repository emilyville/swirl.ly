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

function FlushCtrl($scope) {
  $scope.flushState = 'start';
  $scope.flush = function() {
  	$scope.flushState = 'flushProcessing';
  };
}

function WatershedCtrl($scope, $http) {
  function success(position) {
    $http({method: 'GET', url: '/api/watershed',
           params: {latitude: position.coords.latitude,
                    longitude: position.coords.longitude}
          }).
    success(function(data, status, headers, config) {
      $scope.watershed = data.watershed;
      $scope.flushState = 'flushResults';
    }).
    error(function(data, status, headers, config) {
      $scope.watershed = 'Error!'
      $scope.flushState = 'start';
    });
  };

  function error(msg) {
    $scope.watershed = 'geolocation error';
    console.log("geolocation error");
  };

  console.log("in the watershed controller");
  if (navigator.geolocation) {
    console.log("getting location");
    navigator.geolocation.getCurrentPosition(success, error);
  }
  console.log("location not supported");
}

