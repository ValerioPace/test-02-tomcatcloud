<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<!--[if IE 8]><html class="no-js ie89 ie8" lang="it"><![endif]-->
<!--[if IE 9]><html class="no-js ie89 ie9" lang="it"><![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="it" ng-app="noipa">
<!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- <link rel="preload" href="{{ '/build/IWT.min.js' | path }}" as="script"> -->
  <!--
    In alternativa a WebFontLoader � possibile caricare il font direttamente da Google
      <link href='//fonts.googleapis.com/css?family=Titillium+Web:400,400italic,700,' rel='stylesheet' type='text/css' />
    o dal repository locale (src/fonts)
  -->
  <script type="text/javascript">
    WebFontConfig = {
      google: {
        families: ['Titillium+Web:300,400,600,700,400italic:latin']
      }
    };
    (function() {
      var wf = document.createElement('script');
      wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
      wf.type = 'text/javascript';
      wf.async = 'true';
      var s = document.getElementsByTagName('script')[0];
      s.parentNode.insertBefore(wf, s);
    })();
  </script>
  
  <title>NoiPa</title>
  
  <!-- include HTML5shim per Explorer 8 -->
  <script src="<c:url value='/resources/js/vendor/modernizr.js'/>"></script>

  <link media="all" rel="stylesheet" href="<c:url value='/resources/css/build.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/header/header.css'/>"/>

  <script src="<c:url value='/resources/js/vendor/jquery.min.js'/>"></script>
  <script src="<c:url value='/resources/js/vendor/momentjs.min.js'/>"></script>
    
  <header class="Header Headroom--fixed js-Headroo u-hiddenPrint">
  <div class="Header-banner  ">
    <div class=" Header-owner Headroom-hideme u-border-bottom-xxs  ">
      <a href=""><span>< Torna all'area pubblica</span></a>
      <div class="Header-languages ">
          <a href="#languages" data-menu-trigger="languages" class="Header-language u-border-none u-zindex-max u-inlineBlock">
            <span class="u-hiddenVisually">lingua attiva:</span>
            <span > User</span>
            <!-- <span ng-class="u-hidden u-md-inlineBlock u-lg-inlineBlock">Italiano</span> -->
            <span class="Icon Icon-expand u-padding-left-xs"></span>
          </a>
          <!--
          <div id="languages" data-menu class="Dropdown-menu Header-language-other u-jsVisibilityHidden u-nojsDisplayNone">
            <span class="Icon-drop-down Dropdown-arrow u-color-white"></span>
            <ul>
              <li><a href="#1" class="u-padding-r-all"><span lang="en">English</span></a></li>
              <li><a href="#3" class="u-padding-r-all"><span lang="de">Deutsch</span></a></li>
              <li><a href="#3" class="u-padding-r-all"><span lang="it">Italiano</span></a></li>
              
            </ul>
          </div>
          -->
      </div>
    </div>
  </div>

  <div class="Header-navbar u-background-50">
      <div class="u-layout-wide Grid Grid--alignMiddle u-layoutCenter">
        <div class="Header-logo Grid-cell" aria-hidden="true">
          <a href="" tabindex="-1">
            <img src="//placehold.it/75x80" alt="">
          </a>
        </div>
  
        <div class="Header-title Grid-cell">
          <h1 class="Header-titleLink">
            <a href="/">
              NoiPa<br>
              <small></small>
            </a>
          </h1>
        </div>
        
       
        <div class="Header-utils Grid-cell">
          <div class="Header-search" id="header-search">
            <form class="Form">
              <div class="Form-field Form-field--withPlaceholder Grid u-background-white u-color-grey-30 u-borderRadius-s" role="search">
                <input class="Form-input Form-input--ultraLean Grid-cell u-sizeFill u-text-r-s u-color-black u-text-r-xs u-borderRadius-s" required="" id="cerca">
                <label class="Form-label u-color-grey-50 u-text-r-xxs" for="cerca">Cerca</label>
                <button class="Grid-cell u-sizeFit Icon-search Icon--rotated u-color-grey-50 u-padding-all-s u-textWeight-700" title="Avvia la ricerca" aria-label="Avvia la ricerca">
              </button>
              </div>
            </form>
           </div>
        </div>
        <div class="Header-toggle Grid-cell">
          <a class="Hamburger-toggleContainer js-fr-offcanvas-open u-nojsDisplayInlineBlock u-lg-hidden u-md-hidden" href="#menu"
            aria-controls="menu" aria-label="accedi al menu" title="accedi al menu">
            <span class="Hamburger-toggle" role="presentation"></span>
            <span class="Header-toggleText" role="presentation">Menu</span>
          </a>
        </div>
  
      </div>
    </div>
    <!-- Header-navbar -->
  

</header>
</head>
<!--  <body class="t-Pac" ng-controller="noiPaController"> -->
<body class="t-Pac" ng-controller="noiPaController">
  

  <div class="u-padding-all-s" style="position:relative;top:200px" ng-init="initApp()">
  
    <div ng-show="successMessage.length > 0" fade class="Prose Alert Alert--success Alert--withIcon u-layout-prose u-padding-r-bottom u-padding-r-right u-margin-r-bottom" role="alert">
	    <h2 class="u-text-h3">
	        {{successMessage}}
	    </h2>
	</div>
	
	<div ng-show="errorMessage.length > 0" fade class="Prose Alert Alert--error Alert--withIcon u-layout-prose u-padding-r-bottom u-padding-r-right u-margin-r-bottom" role="alert">
	    <h2 class="u-text-h3">
	        {{errorMessage}}
	    </h2>
	</div>
  
  
	<div>
		<button type="button" class="Button Button--default u-text-r-xs js-fr-dialogmodal-open" aria-controls="addEnteDialog">+ Aggiungi Ente</button>
    </div>
    
	<h2>Elenco Enti PA</h2>
	
	<table class="Table Table--withBorder u-text-r-xs u-padding-top-s" style="position:relative;top:200px">
	    <caption class="u-hiddenVisually">Enti visualizzati</caption>
	    <thead>
	        <tr class="u-border-bottom-xs">
	        	<th>Nominativo ente</th>
	            <th>Indirizzo</th>
	            <th>Data di inizio</th>
	            <th>Azioni</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<tr ng-repeat="ente in listEntiResult">
	    		<td>{{ente.name}}</td>
	    		<td>{{ente.address}}</td>
	    		<td>{{ente.startDate}}</td>
	    		<td>
	    			<ul class="Grid">
    					<li class="Grid-cell u-sm-size1of2 u-md-size1of4 u-lg-size1of6">
    						<div class="u-padding-r-all">						  
            					<span class="u-text-r-l Icon Icon-search" ng-click="showEnte(ente)"></span>     					  
        					</div>
    					</li>
    					<li class="Grid-cell u-sm-size1of2 u-md-size1of4 u-lg-size1of6">
    						<div class="u-padding-r-all">		  
            					<span class="u-text-r-l Icon Icon-settings" ng-click="updateEnte(ente)"></span>
        					</div>
    					</li>
    					<li class="Grid-cell u-sm-size1of2 u-md-size1of4 u-lg-size1of6">
    						<div class="u-padding-r-all">
            					<span class="u-text-r-l Icon Icon-cancel" ng-click="deleteEnte(ente.enteId)"></span>
        					</div>
    					</li>
    				</ul>
	    		</td>
	    	</tr>
	    </tbody>
    </table>
    
    <div class="Dialog js-fr-dialogmodal" id="addEnteDialog" style="z-index:1000">
    <div class="
      Dialog-content
      Dialog-content--centered
      u-background-white
      u-layout-prose
      u-margin-all-xl
      u-padding-all-xl
      js-fr-dialogmodal-modal
    " aria-labelledby="modal-title">
    
       <form name="enteForm" class="Form Form--spaced u-padding-all-xl u-background-grey-10 u-text-r-xs u-layout-prose" novalidate>
	    <div class="Prose Alert Alert--info" ng-if="action!='update' && action!='create'">
	        <p>Tutti i campi sono richiesti salvo dove espressamente indicato</p>
	    </div>
	    
	    <fieldset class="Form-fieldset" ng-switch="action">
        <legend class="Form-legend" ng-switch-when="create">Inserimento nuovo ente</legend>
        <legend class="Form-legend" ng-switch-when="update">Aggiornamento ente</legend>

        <div class="Form-field">
    	 <label class="Form-label is-required" for="nome">Nome</label>
    	  	<span style="color:red;display:block" ng-show="enteForm.nome.$dirty && enteForm.nome.$invalid">
				<span ng-show="enteForm.nome.$error.required">Nome Ente obbligatorio.</span>	
			</span>
            <input class="Form-input" name="nome" id="nome" aria-required="true" ng-model="ente.name" required>
        </div>

        <div class="Form-field">
            <label class="Form-label is-required" for="address">Indirizzo</label>
            <span style="color:red;display:block" ng-show="enteForm.address.$dirty && enteForm.address.$invalid">
				<span ng-show="enteForm.address.$error.required">Indirizzo obbligatorio.</span>	
				<span ng-show="enteForm.address.$error.pattern">Indirizzo non valido secondo il pattern /(\w+)\s*-\s*[0-9]{5}\s+\w+\(\w{2}\)/ e.g: Piazza Euclide 7 - 00134 ROMA(RM)</span>
			</span>
            <input class="Form-input" name="address" id="address" aria-required="true" ng-model="ente.address" required ng-pattern="/(\w+)\s*-\s*[0-9]{5}\s+\w+\(\w{2}\)/">
        </div>
        
        <div class="Form-field">
            <label class="Form-label" for="ddn">Data di inizio attivit&agrave; <small>(opzionale)</small></label>
            <span style="color:red;display:block" ng-show="enteForm.ddn.$dirty && enteForm.ddn.$invalid">
				<span ng-show="enteForm.ddn.$error.required">Data di inizio richiesta.</span>
				<span ng-show="enteForm.ddn.$error.pattern">Data di inizio non valida (DD/MM/YYYY).</span>
			</span>
            <input type="text" name="ddn" class="Form-input" id="ddn" ng-model="ente.startDate" mo-date-input="DD/MM/YYYY" ng-pattern="/\d{2}\/\d{2}\/\d{4}/" aria-describedby="info-ddn">
            <div role="tooltip" id="info-ddn">nel formato GG/MM/ANNO</div>
        </div>
        
        <div class="Form-field Grid-cell u-textRight" ng-switch="action">
        	<button type="button" ng-switch-when="show" class="Button Button--default u-text-xs" ng-disabled="true">Hide</button>
        	<button type="button" ng-switch-when="update" class="Button Button--default u-text-xs" ng-disabled="enteForm.$invalid" ng-click="doUpdateEnte(ente)">Aggiorna</button>
        	<button type="button" ng-switch-when="create" class="Button Button--default u-text-xs" ng-disabled="enteForm.$invalid" ng-click="addEnte(ente)">Salva</button>
        	<button class="Button Button--danger js-fr-dialogmodal-close u-floatRight">Chiudi</button>
    	</div>
    	</fieldset>
    	
       </form>
    </div>
</div>
    
      <a href="#" class="Forward Forward--floating js-scrollTo u-color-70" aria-hidden="true" style="position:relative;top:360px">
    		<span class="Icon Icon-expand"></span>
		</a>  
	
</div>
  
  <script src="<c:url value='/resources/js/angular/angular.js'/>"></script>
  <script src="<c:url value='/resources/js/angular/angular-route.js'/>"></script>
   <script type="text/javascript">
  //Declare app level module which depends on filters, and services
   
  var ngApp = angular.module('noipa', [
   
  ]);
  
  ngApp.controller('noiPaController', function($scope,$http) {
	   
	  $scope.listEntiResult = [];
      $scope.ente = {"name": "", "address": "", "startDate": new Date()};     
      $scope.action="create";
      
      $scope.initApp = function (){
    	  
      	$scope.successMessage="";
      	$scope.errorMessage="";
      	$scope.action="create";
        	       	
          $http.get("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/all")
          
  	          .then(function(response) {
  	        	  console.log("enti: " + JSON.stringify(response.data));
  	              $scope.listEntiResult = response.data;
  	          });
                   
        };
      
      $scope.listEnti = function (){
    	         	
    	$scope.action="create";
        $http.get("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/all")
        
	          .then(function(response) {
	        	  console.log("enti: " + JSON.stringify(response.data));
	              $scope.listEntiResult = response.data;
	          });
                 
      };
      
      $scope.addEnte = function(ente){
      	
      	console.log("popup add ente committed, ente: " + JSON.stringify(ente));
      	$scope.action="create";
      	
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
	        	  $scope.successMessage="Inserimento nuovo ente "+ $scope.ente.name +" avvenuto con successo";
	        	  
	        	  $http.get("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/all")
	              
			          .then(function(response) {
			        	  console.log("enti: " + JSON.stringify(response.data));
			              $scope.listEntiResult = response.data;
			          });
	        	  	        	  
	             
	          });
      	
      };
      
      $scope.showEnte = function(ente){
    	  
    	  console.log("show ente: " + JSON.stringify(ente));
    	  $scope.action="show";
    	  
    	  $http.post("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/show",
    			  ente, {"timeout": 5000})
        			.then(function(response) {
        				
        				var enteToUpdate = response.data;
          				$scope.ente = enteToUpdate;
          				
          				angular.element("button[aria-controls='addEnteDialog']").click();
          });
    	  
      };
      
	  $scope.updateEnte = function(ente){
		  
		  console.log("update ente: " + JSON.stringify(ente));
		  $scope.action="update";
		  
		  $http.post("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/show",
				  ente, {"timeout": 5000})
      			.then(function(response) {
      				
      				var enteToUpdate = response.data;
      				$scope.ente = enteToUpdate;
      				
      				angular.element("button[aria-controls='addEnteDialog']").click();
      				
      	  });
      };
      
	 $scope.doUpdateEnte = function(ente){
		  
		  console.log("update ente: " + JSON.stringify(ente));
		  var enteWithFormattedDate = {
				    "enteId":ente.enteId,
	      			"name":ente.name,
	      			"address":ente.address,
	      			"startDate":moment(ente.startDate).format("DD/MM/YYYY")
	      	};
		  
		  $http.post("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/update",
				  enteWithFormattedDate, {"timeout": 5000})
	      			.then(function(response) {
	      				
	      				var enteResult = response.data;
	      				$scope.successMessage="Ente aggiornato correttamente: " + enteResult.name;
	      				$scope.listEnti();
	      				
	      });
      };
      
	  $scope.deleteEnte = function(enteId){
    	  
		  console.log("delete ente id: " + enteId);
		  $scope.action="delete";
		  
		  $http.get("http://test02-app-test-noipa-cloud.192.168.99.100.nip.io/noipa-test/rest/enti/delete/" + enteId)
			  .then(function(response) {
				  
	        	  console.log("Ente cancellato: " + enteId);
	              $scope.successMessage="Ente cancellato: " + enteId;
	              
	              $scope.listEnti();
				  
	      });
      };
  });
  
  ngApp.directive('moDateInput', function ($window) {
	    return {
	        require:'^ngModel',
	        restrict:'A',
	        link:function (scope, elm, attrs, ctrl) {
	            var moment = $window.moment;
	            var dateFormat = attrs.moMediumDate;
	            attrs.$observe('moDateInput', function (newValue) {
	                //if (dateFormat == newValue || !ctrl.$modelValue) return;
	                if (dateFormat == newValue) return;
	                dateFormat = newValue;
	                ctrl.$modelValue = new Date(ctrl.$setViewValue);
	            });

	            ctrl.$formatters.unshift(function (modelValue) {
	                scope = scope;
	                if (!dateFormat || !modelValue) return "";
	                
	                var datePattern = /\d{1,2}\/\d{2}\/\d{4}/g;
	                
	                var retVal = modelValue; 
	                
	                if(angular.isString(modelValue) && datePattern.test(modelValue)){
	                	retVal = modelValue;
	                }
	                else{  	
	                	retVal = moment(modelValue).format(dateFormat);
	                }
	                
	                return retVal;
	            });

	            ctrl.$parsers.unshift(function (viewValue) {
	                scope = scope;
	                
	                var date = null;
	                
	                var datePattern = /\d{1,2}\/\d{2}\/\d{4}/g;
	                if(angular.isString(viewValue) && datePattern.test(viewValue)){	                
	                  date = moment(viewValue, dateFormat);
	                }
	                else{
	                	date = moment(viewValue);
	                }
	                
	                return (date && date.isValid() && date.year() > 1950 ) ? date.toDate() : "";
	            });
	        }
	    };
	});
  
    ngApp.directive('fade', function () {
	    return {
	        restrict: 'AC',
	        link: function (scope, element, attrs) {
	        	
	        	scope.$watch('successMessage', function(newvalue,oldvalue){
	        		
	        		if(newvalue != oldvalue){
		        		if(element.css("display") != "none"){
			            	element.fadeOut(5000);
			        	}
			        	else{
			            	element.fadeIn(2000);
			        	}
	        		}
	        	});
	        	
	        }
	    };
	});
    
  
  /*
  angModule.directive('moChangeProxy', function ($parse) {
	    return {
	        require:'^ngModel',
	        restrict:'A',
	        link:function (scope, elm, attrs, ctrl) {
	            var proxyExp = attrs.moChangeProxy;
	            var modelExp = attrs.ngModel;
	            scope.$watch(proxyExp, function (nVal) {
	                if (nVal != ctrl.$modelValue)
	                    $parse(modelExp).assign(scope, nVal);
	            });
	            elm.bind('blur', function () {
	                var proxyVal = scope.$eval(proxyExp);
	                if(ctrl.$modelValue != proxyVal) {
	                    scope.$apply(function(){
	                        $parse(proxyExp).assign(scope, ctrl.$modelValue);
	                    });
	                }
	            });
	        }
	    };
	});
  */
  
  
  </script>
 
  <!--[if IE 8]>
  <script src="<c:url value='/resources/js/vendor/respond.min.js'/>"></script>
  <script src="<c:url value='/resources/js/vendor/rem.min.js'/>"></script>
  <script src="<c:url value='/resources/js/vendor/selectivizr.js'/>"></script>
  <script src="<c:url value='/resources/js/vendor/slice.js'/>"></script>
  <![endif]-->

  <!--[if lte IE 9]>
  <script src="<c:url value='/resources/js/vendor/polyfill.min.js'/>"></script>
  <![endif]-->
  
  <script>__PUBLIC_PATH__="<c:url value='/resources/js/'/>"</script>
  <script src="<c:url value='/resources/js/IWT.min.js'/>"></script>
  
</body>
</html>
    