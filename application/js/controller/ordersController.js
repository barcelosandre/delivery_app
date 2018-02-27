mobileApp.controller('ordersController', function($scope, $rootScope, $translate, appService, $location) {
    $scope.pageClass 			= 'slideLeft';
	$rootScope.appTitle 		= $translate.instant('load.orders.Title');
	$scope.serviceApi			= serviceApi;
	$scope.GetServiceApi		= GetServiceApi;
	$scope.saved 				= localStorage.getItem('appLocalStorageUser');
	$scope.appLocalStorageUser 	= JSON.parse($scope.saved);
	
	if(localStorage.getItem('appLocalStorageUser')!==null){

		$scope.loadData = function() {
			$rootScope.loading = true;

			var requestParams = {
				"token": token,
				"email": $scope.appLocalStorageUser.email
			};
			
			appService.HttpRequest('POST',GetServiceApi+'service/get_historical_orders',requestParams).success(function(data) {
				$scope.requestHistoricalOrder = data;
				$rootScope.loading = false;
			});
		}
		
		$scope.loadData();
		
		$scope.reload = function() {
			$scope.loadData();
		}
	
	}else{
		$location.path('/login');
	}
});
