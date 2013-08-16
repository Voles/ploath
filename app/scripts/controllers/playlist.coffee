window.app.controller('PlaylistController', ['$scope', 'angularFire', 'config', 'PlaylistService', '$routeParams', '$rootScope', 'TrackService', '$location', ($scope, angularFire, config, PlaylistService, $routeParams, $rootScope, TrackService, $location) ->

	angularFire(config.dbRef + '/playlists/' + $routeParams.playlistId, $scope, 'playlist', {})
	
	$scope.play = (trackId) ->
		$location.path('/playlists/' + $routeParams.playlistId + '/' + trackId)
		return
])