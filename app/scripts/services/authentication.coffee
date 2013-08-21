window.app.factory('AuthService', ['angularFire', 'angularFireCollection', 'config', '$rootScope', 'utilities', (angularFire, angularFireCollection, config, $rootScope, utilities) ->

	$rootScope.$on '$routeChangeStart', () ->
		console.log '------ Route changed'

	AuthService = {}
	return AuthService

])