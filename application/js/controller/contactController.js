mobileApp.controller('contactController', function($scope, $translate, $rootScope, appService, $window) {

    $scope.pageClass 		= 'slideLeft';
	$rootScope.appTitle	 	=  $translate.instant('load.contact.Title');
	$scope.serviceApi		=  serviceApi;
	$scope.GetServiceApi	=  GetServiceApi;
	
	
	appService.HttpRequest('GET',GetServiceApi+'service/get_setting?token='+token).success(function(data) {
		$scope.setting 			= data;
		$scope.settingImages 	= data[0].setting_img;
		$scope.settingName 		= data[0].setting_name;
		$scope.lnglat    		= data[0].setting_longitude+','+data[0].setting_latitude;
	});
	

	if(typeof $scope.opening === 'undefined'){
		appService.HttpRequest('GET',GetServiceApi+'service/get_opening?token='+token).success(function(data) {
			$scope.opening 	= data;
		});
	}

	$scope.getStaticMap = function(opts) {
		var src = "http://maps.googleapis.com/maps/api/staticmap?",
			params = angular.extend({
			center: $scope.lnglat,
			zoom: 14,
			size: '512x512',
			markers:'color:red|Clabel:S|'+$scope.lnglat,
			maptype: 'roadmap',
			sensor: false
			},opts),
			  
        query = [];
    
		angular.forEach(params, function(k, v) {
			query.push(v + '=' + encodeURIComponent(k));
		});

		src += query.join('&');
		return src;
   }
});