window.app.factory('PlaylistService', ['$rootScope', 'config', 'angularFire', 'utilities', ($rootScope, config, angularFire, utilities) ->

	angularFire(config.dbRef + '/playlists', $rootScope, 'playlists', {})

	idIsUnique = (id) ->
		return (`typeof $rootScope.playlists[ id ] === 'undefined'`) ? true : false

	generateUniqueName = (string, attempt) ->
		if !attempt
			attempt = 1
		
		if idIsUnique(string + '-' + attempt)
			return string + '-' + attempt
		else
			generateUniqueName(string, attempt + 1)

	PlaylistService = {

		add: (playlist) ->
			urlFriendlyTitle = utilities.makeUrlFriendly( playlist.name )
			generatedId = generateUniqueName( urlFriendlyTitle )

			$rootScope.playlists[ generatedId ] = {
				name: playlist.name,
				tracks: {}
			}

			if $rootScope.user.playlists
				$rootScope.user.playlists[ generatedId ] = true
			else
				$rootScope.user.playlists = { generatedId : true }

			# TODO: add playlist to the user playlists

			return

	}
	return PlaylistService
])