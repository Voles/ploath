app.controller('PlaylistController', ['$scope', 'angularFire', 'config', 'PlaylistService', '$routeParams', '$rootScope', ($scope, angularFire, config, PlaylistService, $routeParams, $rootScope) ->

	playlistId = $routeParams.playlistId
	angularFire(config.dbRef + '/playlists/' + playlistId, $scope, 'playlist', {})

	return
])