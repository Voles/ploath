app.controller('TrackController', ['$scope', 'angularFire', 'config', ($scope, angularFire, config) ->

	# load track via id
	$scope.track = angularFire(config.dbRef + '/tracks/' + $scope.track_key, $scope, {})

	# play
	$scope.play = () ->
		console.log 'Clicked play'
		return

])