window.app.factory('AuthService', ['angularFire', 'angularFireCollection', 'config', '$rootScope', 'utilities', '$location', 'UserService', (angularFire, angularFireCollection, config, $rootScope, utilities, $location, UserService) ->

	promise = angularFire(config.dbRef + '/users', $rootScope, 'users', {})
	auth = undefined

	# go to specific page when logged in / -out
	$rootScope.$watch 'user', () ->
		if $rootScope.user
			$location.path('/playlists')
		else
			$location.path('/login')
	
	promise.then () ->
		auth = new FirebaseSimpleLogin(config.dbRef, (error, user) ->
			if error
				# TODO: handle errors
				console.log error
				$location.path('/login')

			else if user
				if UserService.hasAccount(user.id)
					angularFire(config.dbRef + '/users/' + user.id, $rootScope, 'user', {})

				else
					UserService.registerAndLogin(user)

			else
				# no previous login saved
				$location.path('/login')
		)

	AuthService = {
		login: () ->
			auth.login 'facebook', { remember_me: true }

		logout: () ->
			auth.logout()
	}

	return AuthService
])