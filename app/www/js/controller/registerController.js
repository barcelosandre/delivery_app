mobileApp.controller('registerController', function($scope, $translate, $rootScope, appService, $window) {
	var geocoder 			= new google.maps.Geocoder();
    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle	 	= $translate.instant('load.register.Title');
    $scope.register 		= {};
	$scope.GetServiceApi	= GetServiceApi;
	
	$scope.getLocation  = function() {
        $window.navigator.geolocation.getCurrentPosition(function(position) {
            $scope.$apply(function() {
			
			    $scope.latitude = position.coords.latitude;
                $scope.longitude = position.coords.longitude;
                $scope.accuracy = position.coords.accuracy;
			
				var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
				geocoder.geocode({ 'latLng': latlng }, function (results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
						if (results[1]) {
							$scope.register.address = results[1].formatted_address;
							$scope.getLocation();
						} else {
							alert('Location not found');
						}
					} else {
						//alert('Geocoder failed due to: ' + status);
					}
				});
            });
        }, function(error) {
             alert(error);
        });	
	}
	
	$scope.goRegister  = function() {
		
		$scope.appLocalStorageUser  = JSON.parse(localStorage.getItem('appLocalStorageUser'));
		
		var requestParams = {
			"token": token,
			"email": $scope.register.email,
			"password": $scope.register.password,
			"name": $scope.register.name,
			"phone": $scope.register.phone,
			"address": $scope.register.address,
			"street": $scope.register.street,
			"type": 'internal'
		};

		if(typeof $scope.register.email === 'undefined' && typeof $scope.register.password === 'undefined' && typeof $scope.register.name === 'undefined' && typeof $scope.register.phone === 'undefined' && typeof $scope.register.street === 'undefined'){
			alert('This input form not complete!');
		}else{
			if($scope.register.confirm == $scope.register.password){
				localStorage.setItem('appLocalStorageUser', JSON.stringify(requestParams));
				
				appService.HttpRequest('POST',GetServiceApi+'service/send_register',requestParams).success(function(data) {
					alert(data);
				});
				window.history.go(-2);
			}else{
				alert("The passwords don't match!");
			}
		}
	}
});