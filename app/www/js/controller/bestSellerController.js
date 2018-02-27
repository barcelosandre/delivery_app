mobileApp.controller('bestSellerController', function($scope, $rootScope, $translate, appService,  $routeParams, $location) {
    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle 	= $translate.instant('load.bestSeller.Title');
	$rootScope.itemcategory = $routeParams.category;
	$scope.serviceApi		= serviceApi;
	$scope.GetServiceApi	= GetServiceApi;

	appService.HttpRequest('GET',GetServiceApi+'service/get_best_seller?token='+token).success(function(data) {
		$scope.requestData = data;
    });

	$scope.link = function(menu_id,menu_name) {
		$location.path('/detail/'+menu_id+'/'+menu_name);
	}
	
});