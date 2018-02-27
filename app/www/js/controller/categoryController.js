mobileApp.controller('categoryController', function($scope, $rootScope, $translate, appService) {
    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle	 	= $translate.instant('load.category.Title');
	$scope.serviceApi		= serviceApi;
	$scope.GetServiceApi	= GetServiceApi;

	appService.HttpRequest('GET',GetServiceApi+'service/get_category?token='+token).success(function(data) {
		$scope.requestCategory = data;
    });
});