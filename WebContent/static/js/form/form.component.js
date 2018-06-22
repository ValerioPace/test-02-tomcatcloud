'use strict';

// Register `form` component, along with its associated controller and template
angular.
  module('noipa.form').
  component('formComponent', {
    //templateUrl: $rootScope.resourceUrl + '/js/form/form.template.html',
    templateUrl: '/noipa-test/resources/js/form/form.template.html',
    controller: 
      function formController($scope,$http,FORM_CONFIG) {
        $scope.HEADER_CONFIG = FORM_CONFIG;
        $scope.result = [];
        $scope.listEnti = function (){
        	       	
          $http.get("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/all")
          
	          .then(function(response) {
	              $scope.result = response;
	          });
                   
        }
      }
    
  });

  