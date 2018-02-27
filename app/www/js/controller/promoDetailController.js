mobileApp.controller('promoDetailController', function($scope, $rootScope, $routeParams, appService, $q) {
    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle	 	= $routeParams.title;
	$scope.serviceApi		= serviceApi;
	$scope.GetServiceApi	= GetServiceApi;
	
	var requestParams = {
		"token": token,
		"id": $routeParams.id
	};

	appService.HttpRequest('POST',GetServiceApi+'service/get_promo_detail/', requestParams).success(function(data) {
		$scope.requestPromoDetail = data;
    });
});