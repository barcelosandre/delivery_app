mobileApp.controller('detailController', function($scope, $rootScope, $translate, appService, $routeParams, $filter) {
    $scope.pageClass 		= 'slideLeft';
	$scope.serviceApi		= serviceApi;
	$scope.GetServiceApi	= GetServiceApi;
	$rootScope.appTitle 	= $routeParams.title;
	$rootScope.itemID		= $routeParams.id;
	$scope.itemCount		= 1;
	$rootScope.favoritesNav = true;
	
	var requestParams = {
        "token": token,
		"id": $rootScope.itemID
    };
	
	appService.HttpRequest('POST',GetServiceApi+'service/get_menu_detail',requestParams).success(function(data) {
		$scope.requestDetail = data;
		
		$scope.filterData = $filter('filter')($scope.dataCart.items,{ id: data[0].menu_id });
			$rootScope.headerSecondary = true;
			$rootScope.footerSecondary = true;
			$rootScope.detailTotal	   = true;
		if($scope.filterData != ''){	
			$rootScope.headerSecondary = false;
			$rootScope.footerSecondary = false;
			$rootScope.detailTotal	   = false;
		}
		
		if(localStorage.getItem('appLocalStorage')!==null){
			
			angular.forEach(JSON.parse(localStorage.getItem('appLocalStorage')), function(item) {
				if(item.favorites != null){
					if(item.favorites.id == $scope.requestDetail[0].menu_id){
						$rootScope.favoritesNav = false;
					}
				}
			});
		}
    });

	$rootScope.goFavorites  = function() {
		$rootScope.favoritesNav = false;
		$scope.appLocalStorage  = JSON.parse(localStorage.getItem('appLocalStorage'));
		
		if(localStorage.getItem('appLocalStorage')!==null){
			if($scope.countStorage != 1){
				$scope.appLocalStorage.push({
					favorites:{
						id: $scope.requestDetail[0].menu_id, 
						name: $scope.requestDetail[0].menu_name,
						category: $scope.requestDetail[0].category_name, 
						img: $scope.requestDetail[0].menu_img, 
						desc: $scope.requestDetail[0].menu_desc
					}
				});
				
				localStorage.setItem('appLocalStorage', JSON.stringify($scope.appLocalStorage));
			}
		}else{
			localStorage.setItem('appLocalStorage', JSON.stringify(
			[{favorites:
				{	id: $scope.requestDetail[0].menu_id, 
					name: $scope.requestDetail[0].menu_name,
					category: $scope.requestDetail[0].category_name, 
					img: $scope.requestDetail[0].menu_img, 
					desc: $scope.requestDetail[0].menu_desc
				}
			}]));
		}
		
		alert("Add "+$scope.requestDetail[0].menu_name+" to Favorites");
	}
	
	$scope.qtyPlus  = function() {	
		$scope.itemCount++;
	}

	$scope.qtyMinus = function() {
		if($scope.itemCount > 1){
			$scope.itemCount--;
		}
	}
	
    $scope.addItem = function() {
		$rootScope.footerBadge = $rootScope.footerBadge + $scope.itemCount;
		$rootScope.headerSecondary = false;
		$rootScope.footerSecondary = false;
		$rootScope.detailTotal	   = false;
		
		$rootScope.dataCart.items.push({
			id			: $scope.requestDetail[0].menu_id,
			name		: $scope.requestDetail[0].menu_name,
			category	: $scope.requestDetail[0].category_name,
			qty			: $scope.itemCount,
			img			: $scope.requestDetail[0].menu_img,
			disc		: $scope.requestDetail[0].menu_disc,
			price		: $scope.requestDetail[0].menu_price,
			subtotal	: ($scope.requestDetail[0].menu_price*$scope.itemCount)-(($scope.requestDetail[0].menu_price*$scope.itemCount)*$scope.requestDetail[0].menu_disc/100)
		});			
		alert("Add ("+$scope.itemCount+"x) "+$scope.requestDetail[0].menu_name+" to orders");
		window.history.back();
    }
});