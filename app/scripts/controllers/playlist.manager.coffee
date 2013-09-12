window.app.controller('PlaylistManagerController', ['$scope', '$rootScope', 'PlaylistService', ($scope, $rootScope, PlaylistService) ->
	$scope.editmode = false

	$scope.setEditmode = (enableEditmode) ->
		$scope.editmode = enableEditmode
])