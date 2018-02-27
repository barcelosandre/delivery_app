mobileApp.controller('moreController', function($scope, $translate, $rootScope, $window) {
    $scope.pageClass 			= 'slideLeft';
	$rootScope.appTitle	 		= $translate.instant('load.more.Title');
	
	if(localStorage.getItem('appLocalStorageUser')!==null){
		$scope.link		=	'#account';
	}else{
		$scope.link		=	'#login';
	}
	
	$scope.goLogout  = function() {
		localStorage.removeItem('appLocalStorageUser');
	}
});