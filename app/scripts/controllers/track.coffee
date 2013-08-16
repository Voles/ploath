window.app.controller('TrackController', ['$scope', 'angularFire', 'config', 'PlaylistService', '$routeParams', '$rootScope', 'TrackService', '$location', ($scope, angularFire, config, PlaylistService, $routeParams, $rootScope, TrackService, $location) ->

	angularFire(config.dbRef + '/tracks/' + $routeParams.trackId, $scope, 'track', {})
	
])