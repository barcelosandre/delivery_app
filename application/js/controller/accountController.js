mobileApp.controller('accountController', function($scope, $translate, $rootScope) {
    $scope.pageClass 			= 'slideLeft';
	$rootScope.appTitle	 		= $translate.instant('load.account.Title');
	$scope.serviceApi			= serviceApi;
	$scope.GetServiceApi		= GetServiceApi;
	$scope.saved 				= localStorage.getItem('appLocalStorageUser');
	$scope.appLocalStorageUser 	= JSON.parse($scope.saved);
	
	$scope.goChange  = function() {

		var requestParams = {
			"token": token,
			"email": $scope.appLocalStorageUser.email,
			"password": $scope.appLocalStorageUser.password,
			"name": $scope.appLocalStorageUser.name,
			"phone": $scope.appLocalStorageUser.phone,
			"address": $scope.appLocalStorageUser.address,
			"street": $scope.appLocalStorageUser.street,
			"type": 'internal'
		};

		if($scope.appLocalStorageUser.email == '' || $scope.appLocalStorageUser.password == '' || $scope.appLocalStorageUser.name == '' || $scope.appLocalStorageUser.phone == '' || $scope.appLocalStorageUser.street == ''){
			alert('This input form not complete!');
		}else{
			
			alert('Your change account complete!');
			localStorage.setItem('appLocalStorageUser', JSON.stringify(requestParams));
			appService.HttpRequest('POST',GetServiceApi+'service/send_account_change',requestParams).success(function(data) {
				//$scope.requestPromoDetail = data;
			});
			
	
		}		
	}
});