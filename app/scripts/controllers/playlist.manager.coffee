window.app.controller('PlaylistManagerController', ['$scope', ($scope) ->
	$scope.editmode = false

	$scope.setEditmode = (enableEditmode) ->
		$scope.editmode = enableEditmode
		return
])