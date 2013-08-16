# application module
window.app = angular.module('app', ['firebase'])

# configuration
window.app.config(['$routeProvider', ($routeProvider) ->


	$routeProvider

	# playlist overview
	.when( '/playlists', {
		controller: 'PlaylistController',
		templateUrl: 'views/playlist-overview.html'
	})

	# playlist detail
	.when( '/playlists/:playlistId', {
		controller: 'PlaylistController',
		templateUrl: 'views/playlist-detail.html'
	})

	# login
	.when({
		controller: 'LoginController',
		templateUrl: 'views/login.html'
	})

	# default route
	.otherwise( {
		controller: 'LoginController',
		templateUrl: 'views/login.html'
	})

])

# configuration (via http://ericrohlfs.blogspot.nl/2013/03/constants-in-angularjs.html)
window.app.constant('config', {
	dbRef: new Firebase('https://ploath.firebaseio.com')
})