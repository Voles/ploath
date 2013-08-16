window.app.factory('UserService', ['angularFire', 'angularFireCollection', 'config', '$rootScope', (angularFire, angularFireCollection, config, $rootScope) ->

		auth = new FirebaseSimpleLogin(config.dbRef, (error, user) ->
			if error
				# TODO: handle errors
				console.log error

			else if user
				$rootScope.user = user

			return
		)

		UserService = {

			# authentication with facebook
			performLogin: () ->
				auth.login 'facebook', { remember_me: true }
				return

			# logout
			logout: () ->
				auth.logout();
				return

			# fetch all users manually
			all: () ->
				return angularFireCollection(config.dbRef.child('users'))
		}

		return UserService
])