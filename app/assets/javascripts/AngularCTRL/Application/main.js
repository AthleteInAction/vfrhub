var App = angular.module('App',['APIModule','ngRoute','ngResource','ngSanitize','ui.bootstrap','angularFileUpload']);
App.value('$anchorScroll',angular.noop);
App.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){

	// html5Mode: true;

	$routeProvider
	/* MARKER */  	
	.otherwise({
		
		redirectTo: '/'

	});
	
}]);