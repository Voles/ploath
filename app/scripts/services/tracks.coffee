window.app.factory('TrackService', ['$rootScope', ($rootScope) ->

	angularFire(config.dbRef + '/tracks', $rootScope, 'tracks', {})

	TrackService = {}
	return TrackService
])
