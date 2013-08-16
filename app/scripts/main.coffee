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

	# playlist detail
	.when( '/playlists/:playlistId/:trackId', {
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

window.app.constant('utilities', {
	makeUrlFriendly: (string) ->
		return string
			.toLowerCase() 					# change everything to lowercase
			.replace(/^\s+|\s+$/g, "") 		# trim leading and trailing spaces		
			.replace(/[_|\s]+/g, "-") 		# change all spaces and underscores to a hyphen
			.replace(/[^a-z0-9-]+/g, "") 	# remove all non-alphanumeric characters except the hyphen
			.replace(/[-]+/g, "-") 			# replace multiple instances of the hyphen with a single instance
			.replace(/^-+|-+$/g, "") 		# trim leading and trailing hyphens

	makeAngularSafe: (string) ->
		return string
			.toLowerCase()
			.replace(/[\.]+/g, '')
			.replace(/[#]+/g, '')
			.replace(/[\$]+/g, '')
			.replace(/[\/]+/g, '')
			.replace(/[[]+/g, '')
			.replace(/[\]]+/g, '')

})
