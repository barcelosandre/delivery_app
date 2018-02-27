mobileApp.service('appService', function($http){

    /**
     * Process remote POST request to give URL with given params
     * @param {String} url
     * @param {String} POST params
     * @return {JSON}  response from server
     */
        this.HttpRequest = function (type, url, params) {
		
		Object.toparams = function ObjecttoParams(obj) {
			var p = [];
			for (var key in obj) {
				p.push(key + '=' + encodeURIComponent(obj[key]));
			}
			return p.join('&');
		};
		
		  //return $http({
         return $http({
            method: type,
            url: url,
			data:  Object.toparams(params),
            //timeout: 2000,
			headers: {"Content-Type": "application/x-www-form-urlencoded;charset=utf-8"}
        })
    };

});