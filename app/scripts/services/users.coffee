window.app.factory('UserService', ['angularFire', 'angularFireCollection', 'config', '$rootScope', 'utilities', '$q', (angularFire, angularFireCollection, config, $rootScope, utilities, $q) ->

	angularFire(config.dbRef + '/users', $rootScope, 'users', {})

	UserService = {
		
		hasAccount: (id) ->
			return if `typeof $rootScope.users[ id ] === 'undefined'` then false else true

		registerAndLogin: (facebookData) ->
			promise = angularFire(config.dbRef + '/users/' + facebookData['id'], $rootScope, 'user', {})
			promise.then () ->
				$rootScope.users[facebookData['id']] = {
					name: facebookData['displayName'],
					facebookData: facebookData,
					playlists: {}
				}
	}

	return UserService;
])