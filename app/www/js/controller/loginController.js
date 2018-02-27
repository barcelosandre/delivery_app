mobileApp.controller('loginController', function($scope, $rootScope, $translate, appService, $window) {
    $scope.pageClass 		= 'slideLeft';
	//$rootScope.appTitle	= $translate.instant('load.promo.Title');
	$scope.serviceApi		= serviceApi;
	$scope.GetServiceApi	= GetServiceApi;
	$scope.login			= {};
	$rootScope.header		= false;
	$rootScope.nav	   		= false;

	$scope.getLogin  = function() {
		var requestParams = {
			"token": token,
			"email": $scope.login.email,
			"password": $scope.login.password
		};

		if(typeof $scope.login.email === 'undefined' && typeof $scope.login.password === 'undefined'){
			alert('This input form not complete!');
		}else{
			appService.HttpRequest('POST',GetServiceApi+'service/get_login',requestParams).success(function(data) {
				if(data != 0){

					var requestParams = {
						"token": token,
						"email": data[0].register_email,
						"password": data[0].register_password,
						"name": data[0].register_name,
						"phone": data[0].register_phone,
						"address": data[0].register_address,
						"street": data[0].register_street,
						"type": data[0].register_type
					};
					localStorage.setItem('appLocalStorageUser', JSON.stringify(requestParams));
					alert('Your login success!');
					$window.history.back();
				}else{
					alert('Your login not success!');
				}
			});
		}
	}
});