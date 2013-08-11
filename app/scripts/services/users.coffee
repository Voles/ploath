window.app.factory('Users', ['angularFire', 'angularFireCollection', 'config', (angularFire, angularFireCollection, config) ->
		
		UserService = {

			# authentication with facebook
			authenticate: () ->
				simpleLogin = new FirebaseSimpleLogin(config.dbRef, (error, user) ->
					if error
						console.log error

					else if user
						console.log user

					else
						console.log 'User is logged out'

					return
				)
				
				simpleLogin.login 'facebook', { remember_me: true }
				return


			# fetch all users manually
			all: () ->
				return angularFireCollection(config.dbRef.child('users'))
		}

		return UserService
])