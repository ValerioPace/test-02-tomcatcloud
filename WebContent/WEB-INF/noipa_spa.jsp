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
    In alternativa a WebFontLoader è possibile caricare il font direttamente da Google
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
    
  <header-component></header-component>
</head>
<!--  <body class="t-Pac" ng-controller="noiPaController"> -->
<body class="t-Pac">
  

  <form-component></form-component>
  <script src="<c:url value='/resources/js/angular/angular.js'/>"></script>
  <script src="<c:url value='/resources/js/angular/angular-route.js'/>"></script>
  <script src="<c:url value='/resources/js/header/header.module.js'/>"></script> 
  <script src="<c:url value='/resources/js/header/header.config.js'/>"></script>
  <script src="<c:url value='/resources/js/header/header.component.js'/>"></script>
  <script src="<c:url value='/resources/js/form/form.module.js'/>"></script> 
  <script src="<c:url value='/resources/js/form/form.config.js'/>"></script>
  <script src="<c:url value='/resources/js/form/form.component.js'/>"></script>
  <script type="text/javascript">
  //Declare app level module which depends on filters, and services
  
  var moment = moment();
  
  var ngApp = angular.module('noipa', [
    'noipa.headerModule',
    'noipa.form',
    //,
    //'ngRoute'
  ]);
  
  ngApp.directive('moDateInput', function ($window) {
	    return {
	        require:'^ngModel',
	        restrict:'A',
	        link:function (scope, elm, attrs, ctrl) {
	            var moment = $window.moment;
	            var dateFormat = attrs.moMediumDate;
	            attrs.$observe('moDateInput', function (newValue) {
	                if (dateFormat == newValue || !ctrl.$modelValue) return;
	                dateFormat = newValue;
	                ctrl.$modelValue = new Date(ctrl.$setViewValue);
	            });

	            ctrl.$formatters.unshift(function (modelValue) {
	                scope = scope;
	                if (!dateFormat || !modelValue) return "";
	                var retVal = moment(modelValue).format(dateFormat);
	                return retVal;
	            });

	            ctrl.$parsers.unshift(function (viewValue) {
	                scope = scope;
	                var date = moment(viewValue, dateFormat);
	                return (date && date.isValid() && date.year() > 1950 ) ? date.toDate() : "";
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
    