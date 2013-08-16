window.app.factory('TrackService', ['$rootScope', 'config', 'angularFire', ($rootScope, config, angularFire) ->

	angularFire(config.dbRef + '/tracks', $rootScope, 'tracks', {})

	TrackService = {}
	return TrackService
])
