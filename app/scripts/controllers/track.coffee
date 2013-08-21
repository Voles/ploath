window.app.controller('TrackController', ['$scope', 'angularFire', 'config', 'PlaylistService', '$routeParams', '$rootScope', 'TrackService', '$location', 'AuthService', ($scope, angularFire, config, PlaylistService, $routeParams, $rootScope, TrackService, $location, AuthService) ->

	angularFire(config.dbRef + '/tracks/' + $routeParams.trackId, $scope, 'track', {})
	
])