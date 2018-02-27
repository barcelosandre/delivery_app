mobileApp.controller('messageController', function($scope, $translate, appService, $rootScope, $window) {
    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle	 	= $translate.instant('load.message.Title');
	$scope.message	 		= {};
	$scope.serviceApi		= serviceApi;
	$scope.GetServiceApi	= GetServiceApi;
	
	$scope.sendMessage  = function() {
		var requestParams = {
			"token": token,
			"email": $scope.message.email,
			"name": $scope.message.name,
			"phone": $scope.message.phone,
			"message": $scope.message.message
		};
	
		if(typeof $scope.message.email === 'undefined' && typeof $scope.message.message === 'undefined'){
			alert('This input form not complete!');
		}else{
			
			appService.HttpRequest('POST',GetServiceApi+'service/send_message',requestParams).success(function(data) {
				alert(data);
			});
			window.history.back();
		}
	}
});