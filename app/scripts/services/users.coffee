window.app.factory('UserService', ['angularFire', 'angularFireCollection', 'config', '$rootScope', 'utilities', (angularFire, angularFireCollection, config, $rootScope, utilities) ->

	angularFire(config.dbRef + '/users', $rootScope, 'users', {})

	$rootScope.user = undefined
	clicked = false

	hasAccount = (id) ->
		return if `typeof $rootScope.users[ id ] === 'undefined'` then false else true

	auth = new FirebaseSimpleLogin(config.dbRef, (error, user) ->
		if !clicked
			console.log 'not clicked'

		else
			if error
				# TODO: handle errors
				console.log error

			else if user
				id = utilities.makeAngularSafe( user.username )

				if !hasAccount( id )
					$rootScope.users[ id ] = {
						name: user.displayName,
						facebookData: user,
						playlists: {}
					}

				$rootScope.user = angularFire(config.dbRef + '/users/' + id, $rootScope, 'user', {})
				return
				
		clicked = false
		return
	)

	UserService = {

		# authentication with facebook
		performLogin: () ->
			# clicked is a workaround, because the users aren't loaded fast enough for the check inside FirebaseSimpleLogin
			clicked = true

			auth.login 'facebook', { remember_me: true }
			return

		# logout
		logout: () ->
			auth.logout()
			return
	}

	return UserService
])