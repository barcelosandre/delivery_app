var mobileApp 		= angular.module('mobileApp', ['ngRoute', 'ngAnimate', 'pascalprecht.translate', 'ngCookies','ngSanitize']);
//Set your token database
var token			= 'a8B6c4D4e8F0';
//Set url service app
var serviceApi		= 'http://deliveryapp.zz.mu/admin/';
var GetServiceApi	= serviceApi+'index.php/';

mobileApp.run(function($rootScope, $timeout, $translate, $location, appService) {
	$rootScope.footerBadge 	= 0;
	$rootScope.startPage    = 0;

	FastClick.attach(document.body);
	
	$rootScope.$on('$routeChangeStart', function() {
		$rootScope.loading = true;
	});
	
	$rootScope.$on('$routeChangeSuccess', function () {	
		$timeout(function(){
			$rootScope.loading = false;
		}, 1000);
		
		$rootScope.headerSecondary = true;
		$rootScope.footerSecondary = true;
		$rootScope.favoritesNav    = false;
		$rootScope.detailTotal	   = true;
		$rootScope.header		   = true;
		$rootScope.nav	   		   = true;
		
		if($rootScope.startPage <= 1){
			$rootScope.backNav 	 = false;
		}else{
			$rootScope.backNav 	= true;
		}
		
		if($location.path() != '/'){
			$rootScope.backNav 	= true;
		}
		$rootScope.startPage++;
	});

	$rootScope.$on('$routeChangeError', function() {
		$timeout(function(){
			$rootScope.loading = false;
		}, 1000);
	});

	$rootScope.back  = function() {	
		window.history.back();
	}

	$rootScope.dataCart = {
        items: []
    };

	$rootScope.go = function (path) {
		$location.path(path);
	};
	
	//Phonegap action
	$rootScope.goExit = function(){
		if (navigator.app) {
			navigator.app.exitApp();
		}else if (navigator.device) {
			navigator.device.exitApp();
		}
	}

	$rootScope.goURL = function(url){
		navigator.app.loadUrl(url, { openExternal:true });
		return false;
	} 

	$rootScope.goShare = function () {
		window.plugins.socialsharing.available(function(isAvailable) {
			 if (isAvailable) {		
				// message, subject, image and link
				window.plugins.socialsharing.share($translate.instant('config.share.Massage'), $translate.instant('config.share.Subject'), null, $translate.instant('config.share.Link'));	 
			}
		});
	};
	
	if(typeof $rootScope.setting === 'undefined'){
		appService.HttpRequest('GET',GetServiceApi+'service/get_setting?token='+token).success(function(data) {
			$rootScope.setting 		= data;
			$rootScope.tax  		=  parseInt(data[0].setting_tax);
			$rootScope.shipping    	=  parseInt(data[0].setting_delivery_fee);
		});
	}
});

mobileApp.directive('whenScrolled', function() {
    return function(scope, elm, attr) {
        var raw = elm[0];
        elm.bind('scroll', function() {
            if (raw.scrollTop + raw.offsetHeight >= raw.scrollHeight) {
                scope.$apply(attr.whenScrolled);
            }
        });
    };
});

mobileApp.config(['$translateProvider', function($translateProvider){
	// Register a loader for the static files
	// So, the module will search missing translation tables under the specified urls.
	// Those urls are [prefix][langKey][suffix].
	$translateProvider.useStaticFilesLoader({
		prefix: 'l10n/',
		suffix: '.json'
	});
	// Tell the module what language to use by default
	$translateProvider.preferredLanguage('en_US');
}])

.controller('ctrl', ['$scope', '$translate', function($scope, $translate) {
	$scope.setLang = function(langKey) {
		// You can change the language during runtime
		$translate.use(langKey);
	};
}]);

mobileApp.config(function($routeProvider) {
    $routeProvider
    	.when('/', {
    		templateUrl: 'tpl/home.html',
            controller: 'mainController',
			activePage: 'home'
    	})
    	.when('/menu/:category/:title', {
    		templateUrl: 'tpl/menu.html',
            controller: 'menuController',
			activePage: 'menu'
    	})
    	.when('/detail/:id/:title', {
    		templateUrl: 'tpl/detail.html',
            controller: 'detailController',
			activePage: 'detail'
    	})
    	.when('/category', {
    		templateUrl: 'tpl/category.html',
            controller: 'categoryController',
			activePage: 'category'
    	})
    	.when('/search', {
    		templateUrl: 'tpl/search.html',
            controller: 'searchController',
			activePage: 'search'
    	})
    	.when('/cart', {
    		templateUrl: 'tpl/cart.html',
            controller: 'cartController',
			activePage: 'cart'
    	})
    	.when('/provideDetail', {
    		templateUrl: 'tpl/provideDetail.html',
            controller: 'cartController',
			activePage: 'cart'
    	})
    	.when('/favorites', {
    		templateUrl: 'tpl/favorites.html',
            controller: 'favoritesController',
			activePage: 'favorites'
    	})
    	.when('/contact', {
    		templateUrl: 'tpl/contact.html',
            controller: 'contactController',
			activePage: 'contact'
    	})
    	.when('/message', {
    		templateUrl: 'tpl/message.html',
            controller: 'messageController',
			activePage: 'message'
    	})
    	.when('/orders', {
    		templateUrl: 'tpl/orders.html',
            controller: 'ordersController',
			activePage: 'orders'
    	})
    	.when('/promo', {
    		templateUrl: 'tpl/promo.html',
            controller: 'promoController',
			activePage: 'promo'
    	})
    	.when('/promoDetail/:id/:title', {
    		templateUrl: 'tpl/promoDetail.html',
            controller: 'promoDetailController',
			activePage: 'promoDetail'
    	})
    	.when('/register', {
    		templateUrl: 'tpl/register.html',
            controller: 'registerController',
			activePage: 'register'
    	})
    	.when('/login', {
    		templateUrl: 'tpl/login.html',
            controller: 'loginController',
			activePage: 'login'
    	})
    	.when('/account', {
    		templateUrl: 'tpl/account.html',
            controller: 'accountController',
			activePage: 'account'
    	})
    	.when('/bestSeller', {
    		templateUrl: 'tpl/bestSeller.html',
            controller: 'bestSellerController',
			activePage: 'about'
    	})
    	.when('/more', {
    		templateUrl: 'tpl/more.html',
            controller: 'moreController',
			activePage: 'more'
    	});
});

//navCtrl definition
mobileApp.controller('navCtrl', function($scope, $route) {
    $scope.$route = $route;
});