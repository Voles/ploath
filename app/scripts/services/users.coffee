window.app.factory('UserService', ['angularFire', 'angularFireCollection', 'config', '$rootScope', 'utilities', (angularFire, angularFireCollection, config, $rootScope, utilities) ->

	angularFire(config.dbRef + '/users', $rootScope, 'users', {})

	hasAccount = (id) ->
		return if `typeof $rootScope.users[ id ] === 'undefined'` then false else true

	

	UserService = {

		# authentication with facebook
		performLogin: () ->
			# clicked is a workaround, because the users aren't loaded fast enough for the check inside FirebaseSimpleLogin
			clicked = true
			return
	}

	return UserService
])