'use strict';

// Register `header` component, along with its associated controller and template
angular.
  module('noipa.headerModule').
  component('headerComponent', {
    templateUrl: 'header.template.html',
    controller: 
      function HeaderController($scope,$http,HEADER_CONFIG) {
        $scope.HEADER_CONFIG = HEADER_CONFIG;
        $http.get(HEADER_CONFIG.userEndpoint).
        then(function(response) {
            $scope.utente = response.data.value;
        });
       
      }
    
  });
