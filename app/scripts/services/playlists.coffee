window.app.factory('PlaylistService', ['$rootScope', 'config', 'angularFire', ($rootScope, config, angularFire) ->

	angularFire(config.dbRef + '/playlists', $rootScope, 'playlists', {})

	PlaylistService = {}
	return PlaylistService
])