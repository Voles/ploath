window.app.factory('UserService', ['angularFire', 'angularFireCollection', 'config', '$rootScope', 'utilities', (angularFire, angularFireCollection, config, $rootScope, utilities) ->

	angularFire(config.dbRef + '/users', $rootScope, 'users', {})

	UserService = {
		usersLoaded: false
		hasAccount: (id) ->
			return if `typeof $rootScope.users[ id ] === 'undefined'` then false else true

		createAccount: (facebookData) ->
			#angularFire(config.dbRef + '/users/' + facebookData['id'], $rootScope, 'user', {})
			return {
				name: facebookData['displayName'],
				facebookData: facebookData,
				playlists: {}
			}
			console.log $rootScope.users
	}

	$rootScope.$watch 'users', () ->
		console.log '- changed users'
		console.log $rootScope.users
		UserService.usersLoaded = if `typeof $rootScope.users === 'undefined'` then false else true
		console.log UserService.usersLoaded

	return UserService;
])