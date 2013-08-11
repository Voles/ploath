# application module
window.app = angular.module('app', ['firebase'])

# controller
window.app.controller('MyCtrl', ['$scope', 'angularFire', 'config', 'Users', ($scope, angularFire, config, Users) ->

	# test authentication
	Users.authenticate()
	
	promise = angularFire(config.dbRef, $scope, 'users', {})
	promise.then () ->
		console.log 'jeet'
		return

	#Users.referenceVariable
	return
])

# configuration (via http://ericrohlfs.blogspot.nl/2013/03/constants-in-angularjs.html)
window.app.constant('config', {
	dbRef: new Firebase('https://ploath.firebaseio.com')
})