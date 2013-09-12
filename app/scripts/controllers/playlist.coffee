window.app.controller('PlaylistController', ['$scope', 'angularFire', 'config', 'PlaylistService', '$routeParams', '$rootScope', 'TrackService', '$location', 'AuthService', ($scope, angularFire, config, PlaylistService, $routeParams, $rootScope, TrackService, $location, AuthService) ->

	angularFire(config.dbRef + '/playlists/' + $routeParams.playlistId, $scope, 'playlist', {})
	
	$scope.play = (trackId) ->
		$location.path('/playlists/' + $routeParams.playlistId + '/' + trackId)
		return

	$scope.add = (playlist) ->
		PlaylistService.add(playlist)


	$scope.logout = () ->
		AuthService.logout()

	$scope.removeTrack = (trackId) ->
		PlaylistService.removeTrack($routeParams.playlistId, trackId)
		
])