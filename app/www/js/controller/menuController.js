mobileApp.controller('menuController', function($scope, $rootScope, appService,  $routeParams, $location) {
    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle 	= $routeParams.title;
	$rootScope.itemcategory = $routeParams.category;
	$scope.serviceApi		= serviceApi;
	$scope.GetServiceApi	= GetServiceApi;

	var requestParams = {
        "token": token,
		"category": $rootScope.itemcategory 
    };
	
	appService.HttpRequest('POST',GetServiceApi+'service/get_menu/', requestParams).success(function(data) {
		$scope.requestData = data;
    });

	$scope.link = function(menu_id,menu_name) {
		$location.path('/detail/'+menu_id+'/'+menu_name);
	}
	
});