# application module
window.app = angular.module('app', ['firebase'])

# controller
window.app.controller('MyCtrl', ['$scope', '$rootScope', 'angularFire', 'config', 'Users', ($scope, $rootScope, angularFire, config, Users) ->

	# test authentication
	#Users.authenticate()
	
	angularFire(config.dbRef + '/playlists', $rootScope, 'playlists', {})
	angularFire(config.dbRef + '/tracks', $rootScope, 'tracks', {})
	console.log($rootScope)

	# play
	$scope.play = (trackId) ->
		console.log 'Play track with id: ' + trackId
		return
		
	return
])

# configuration (via http://ericrohlfs.blogspot.nl/2013/03/constants-in-angularjs.html)
window.app.constant('config', {
	dbRef: new Firebase('https://ploath.firebaseio.com')
})