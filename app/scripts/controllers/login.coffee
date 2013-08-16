app.controller('LoginController', ['$scope', '$rootScope', 'UserService', '$location', ($scope, $rootScope, UserService, $location) ->

	$rootScope.$watch('user', () ->
		if $rootScope.user
			$location.path('/playlists')
		return
	)
	
	$scope.login = () ->
		UserService.performLogin()
		return
	
])