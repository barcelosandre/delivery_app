mobileApp.controller('searchController', function($scope, $rootScope, $translate, appService, $location) {
    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle	 	= $translate.instant('load.search.Title');;
	$scope.serviceApi		= serviceApi;
	$scope.GetServiceApi	= GetServiceApi;
	
	
	$scope.getSearch = function() {
		$rootScope.loading = true;
		var requestParams = {
			"token": token,
			"data": $scope.itemSearch
		};
		
		appService.HttpRequest('POST',GetServiceApi+'service/get_menu/', requestParams).success(function(data) {
			$scope.requestSearch = data;
			$rootScope.loading   = false;
		});
	}
	
	$scope.getPath = function(menu_id,menu_name) {
		$location.path('/detail/'+menu_id+'/'+menu_name);
	}
});