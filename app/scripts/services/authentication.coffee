window.app.factory('AuthService', ['angularFire', 'angularFireCollection', 'config', '$rootScope', 'utilities', '$location', 'UserService', (angularFire, angularFireCollection, config, $rootScope, utilities, $location, UserService) ->

	console.log 'Init AuthService'

	AuthService = {
		user: false,
		isChecked: false,

		login: () ->
			auth.login 'facebook', { remember_me: true }

		logout: () ->
			auth.logout()
	}

	# simple login check
	auth = new FirebaseSimpleLogin(config.dbRef, (error, user) ->
		if error
			# TODO: handle errors
			console.log error
			AuthService.isChecked = true
			$location.path('/login')

		else if user
			# user is logged in
			console.log user

			###
			if UserService.hasAccount(user.id)
				console.log 'jep'
			else
				console.log 'nop'
			###

			if UserService.usersLoaded
				console.log $rootScope.users
				console.log '# users known'
				if UserService.hasAccount(user.id)
					console.log 'jep'
				else
					console.log 'nop'
			else
				$rootScope.$watch 'users', () ->
					if UserService.usersLoaded
						if UserService.hasAccount(user.id)
							console.log '2.'
							AuthService.user = angularFire(config.dbRef + '/users/' + user.id, $rootScope, 'user', {})
							$location.path('/playlists')
						else
							console.log '1.'
							UserService.createAccount(user)
							AuthService.isChecked = true
							console.log config.dbRef + '/users/' + user.id
							angularFire(config.dbRef + '/users/' + user.id, $rootScope, 'user', {})

							$rootScope.$watch('users.' + user.id, () ->
								console.log $rootScope.users['user.id']
							)

							#$rootScope.user.name = user['displayName'];
							#AuthService.user.name = 'jo'
							$location.path('/playlists')

			AuthService.userId = user.id
			$location.path('/playlists')

		else
			# no previous login saved
			console.log 'No previous login saved'
			AuthService.isChecked = true
			$location.path('/login')
	)

	$rootScope.$on '$routeChangeStart', () ->
		if AuthService.isChecked && !AuthService.userId
			$location.path('/login')

	return AuthService

])