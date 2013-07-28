myapp = angular.module('myapp', ['firebase'])
myapp.controller('MyCtrl', ['$scope', 'angularFire', ($scope, angularFire) ->
	url = 'https://ploath.firebaseio.com/users';
	promise = angularFire(url, $scope, 'users', []);
	promise.then () ->
		$scope.users.push {username:"superUser"}
		console.log 'added superUser'
		return

	return
])
