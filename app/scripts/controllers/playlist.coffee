app.controller('PlaylistController', ['$scope', 'angularFire', 'config', 'PlaylistService', '$routeParams', '$rootScope', 'TrackService', ($scope, angularFire, config, PlaylistService, $routeParams, $rootScope, TrackService) ->

	playlistId = $routeParams.playlistId
	angularFire(config.dbRef + '/playlists/' + playlistId, $scope, 'playlist', {})

	return
])