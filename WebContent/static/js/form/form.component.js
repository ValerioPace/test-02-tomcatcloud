'use strict';

// Register `form` component, along with its associated controller and template
angular.
  module('noipa.form').
  component('formComponent', {
    
    templateUrl: '/noipa-test/resources/js/form/form.template.html',
    controller: 
      function formController($scope,$http,FORM_CONFIG) {
        $scope.HEADER_CONFIG = FORM_CONFIG;
        $scope.listEntiResult = [];
        $scope.ente = {"name": "", "address": "", "startDate": new Date()};
        $scope.listEnti = function (){
        	       	
          $http.get("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/all")
          
	          .then(function(response) {
	        	  console.log("enti: " + JSON.stringify(response.data));
	              $scope.listEntiResult = response.data;
	          });
                   
        };
        
        $scope.addEnte = function(ente){
        	
        	console.log("popup add ente committed, ente: " + JSON.stringify(ente));
        	
        	var enteWithFormattedDate = {
        			"name":ente.name,
        			"address":ente.address,
        			"startDate":moment(ente.startDate).format("DD/MM/YYYY")
        	};
        	
        	$http.post("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/add",
        			enteWithFormattedDate, {"timeout": 5000})         
	          .then(function(response) {
	        	  console.log("new ente: " + JSON.stringify(response.data));
	        	  $scope.ente = response.data;
	        	  
	        	  $http.get("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/all")
	              
			          .then(function(response) {
			        	  console.log("enti: " + JSON.stringify(response.data));
			              $scope.listEntiResult = response.data;
			          });
	        	  	        	  
	             
	          });
        	
        };
        
        /*
        $scope.addEntePopup = function(){
        	      
        	console.log("popup add ente opened")
        	//$('#addEnteDialog').open();
        }
        */
      }
    
  });

  