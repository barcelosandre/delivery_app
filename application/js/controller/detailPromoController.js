mobileApp.controller('detailPromoController', function($scope, $rootScope, $translateappService, $routeParams, $filter) {
    $scope.pageClass 		= 'slideLeft';
	$scope.serviceApi		= serviceApi;
	$scope.GetServiceApi	= GetServiceApi;
	$rootScope.appTitle 	= $routeParams.title;
	$rootScope.promoID		= $routeParams.id;
	
	var requestParams = {
        "token": token,
		"id": $rootScope.promoID
    };
	
	appService.HttpRequest('POST',GetServiceApi+'service/get_promo_detail',requestParams).success(function(data) {
		$scope.requestPromoDetail = data;
    });
 });