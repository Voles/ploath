window.app.controller('UserController', ['$scope', 'AuthService', ($scope, AuthService) ->

	$scope.logout = () ->
		AuthService.logout()

	$scope.login = () ->
		AuthService.login()

])