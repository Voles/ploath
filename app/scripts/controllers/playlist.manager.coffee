window.app.controller('PlaylistManagerController', ['$scope', '$rootScope', 'PlaylistService', ($scope, $rootScope, PlaylistService) ->
	$scope.editmode = false

	$scope.setEditmode = (enableEditmode) ->
		$scope.editmode = enableEditmode

	$scope.addTrack = (track) ->
		console.log 'ADD TRACK'
		# youtube title
		$.ajax
			url: 'https://gdata.youtube.com/feeds/api/videos/N4_dzevyFK8?alt=json'
			async: true
		.done (aha) ->
			console.log 'DONE 1'
			console.log aha
			title = aha.entry.title.$t
			console.log title

			#API Key: de796dc0e5687dd2b3054eea82c4ac83 Secret: is 783bbdc3050e3d795045f03019c031d6

			# track info
			$.ajax
				url: 'http://ws.audioscrobbler.com/2.0/?method=track.search&track=' + encodeURIComponent(title) + '&api_key=de796dc0e5687dd2b3054eea82c4ac83&format=json'
				async: true
			.done (response) ->
				console.log response
				console.log response.results.trackmatches.track[0].artist + ' ~ ' + response.results.trackmatches.track[0].name

])