app.controller('LoginController', ['$scope', '$rootScope', 'UserService', '$location', 'AuthService', ($scope, $rootScope, UserService, $location, AuthService) ->

	$rootScope.$watch('user', () ->
		if $rootScope.user
			$location.path('/playlists')
		return
	)
	
	$scope.login = () ->
		AuthService.login()
		
])