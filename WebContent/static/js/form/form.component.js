'use strict';

// Register `form` component, along with its associated controller and template
angular.
  module('noipa.form').
  component('formComponent', {
    templateUrl: '/resources/js/form/form.template.html',
    controller: 
      function formController($scope, $rootScope,$http,FORM_CONFIG) {
        $scope.HEADER_CONFIG = FORM_CONFIG;
        $scope.result = [];
        $scope.listEnti = function (){
        	       	
          $http.get($rootScope.serviceUrl + "/enti/all")
	          .then(function(response) {
	              $scope.result = response;
	          });
                   
        }
      }
    
  });

  