mobileApp.controller('mainController', function($scope, $rootScope, appService, $q) {
    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle		= '<img src="img/logo.png" width="180px">';
	//$rootScope.appTitle	 = 'Home';
	$scope.serviceApi		= serviceApi;
	$scope.GetServiceApi	= GetServiceApi;

	$scope.LoadMoreData = function() {
		alert(1);
	}

	var requestParams = {
        "token": token
    };

	$rootScope.goReload = function() {
		$rootScope.loading = true;
		appService.HttpRequest('GET',GetServiceApi+'service/get_menu/',requestParams).success(function(data) {
			$scope.requestData = data;
			$rootScope.loading = false;
		});
	}

	appService.HttpRequest('GET',GetServiceApi+'service/get_menu/', requestParams).success(function(data) {
		$scope.requestData = data;
    });
});