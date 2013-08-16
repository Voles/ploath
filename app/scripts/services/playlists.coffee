window.app.factory('PlaylistService', ['$rootScope', 'config', 'angularFire', ($rootScope, config, angularFire) ->

	angularFire(config.dbRef + '/playlists', $rootScope, 'playlists', {})

	makeUrlFriendly = (string) ->
		url = string
			.toLowerCase() 					# change everything to lowercase
			.replace(/^\s+|\s+$/g, "") 		# trim leading and trailing spaces		
			.replace(/[_|\s]+/g, "-") 		# change all spaces and underscores to a hyphen
			.replace(/[^a-z0-9-]+/g, "") 	# remove all non-alphanumeric characters except the hyphen
			.replace(/[-]+/g, "-") 			# replace multiple instances of the hyphen with a single instance
			.replace(/^-+|-+$/g, "") 		# trim leading and trailing hyphens

		return url

	isPlaylistIdUnique = (id) ->
		return (`typeof $rootScope.playlists[ id ] === 'undefined'`) ? true : false
	
	PlaylistService = {

		add: (playlist) ->
			console.log 'Add'
			console.log playlist
			console.log '///'

			# unique, url-friendly id
			generate = (urlFriendlyTitle, attempt) ->
				if !attempt
					attempt = 1
					if isPlaylistIdUnique(urlFriendlyTitle)
						return urlFriendlyTitle
					else
						generate(urlFriendlyTitle, attempt + 1)
				else
					if isPlaylistIdUnique(urlFriendlyTitle + '-' + attempt)
						return urlFriendlyTitle + '-' + attempt
					else
						generate(urlFriendlyTitle, attempt + 1)

			console.log '###'
			theName = generate(makeUrlFriendly(playlist.title))
			$rootScope.playlists[ theName ] = {
				name: playlist.title,
				tracks: []
			}
			console.log '###'

			###
			$rootScope.playlists[playlist.title] = {
				name: playlist.title,
				tracks: {}
			}
			###

			return

	}
	return PlaylistService
])