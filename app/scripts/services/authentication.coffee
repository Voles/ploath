window.app.factory('AuthService', ['angularFire', 'angularFireCollection', 'config', '$rootScope', 'utilities', '$location', (angularFire, angularFireCollection, config, $rootScope, utilities, $location) ->

	console.log 'Init AuthService'

	AuthService = {
		userId: undefined,
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