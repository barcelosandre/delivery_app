mobileApp.controller('favoritesController', function($scope, $rootScope) {
    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle	 	= 'Favorites';
	$scope.serviceApi		= serviceApi;
	$scope.saved 			= localStorage.getItem('appLocalStorage');
	$scope.appLocalStorage 	= JSON.parse($scope.saved);
	
	$scope.goRemoveFavorites  = function(index) {
		$scope.appLocalStorage  = JSON.parse(localStorage.getItem('appLocalStorage'));
		$scope.appLocalStorage.splice(index,1); 
		localStorage.setItem('appLocalStorage', JSON.stringify($scope.appLocalStorage));
	}
});

mobileApp.controller('ordersController', function($scope, $rootScope) {
    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle	 	= 'Historical Orders';
	$scope.serviceApi		= serviceApi;
	$scope.saved 			= localStorage.getItem('appLocalStorage');
	$scope.appLocalStorage 	= JSON.parse($scope.saved);
});
