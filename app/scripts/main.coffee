myapp = angular.module('myapp', ['firebase'])
myapp.controller('MyCtrl', ['$scope', 'angularFire', ($scope, angularFire) ->

	dbRef = new Firebase('https://ploath.firebaseio.com/')

	# authentication handler
	auth = new FirebaseSimpleLogin(dbRef, (error, user) ->
	  if error
	    console.log error
	  
	  else if user
	    console.log 'User ID: ' + user.id + ', Provider: ' + user.provider
	  
	  else
	    console.log 'User is logged out'
	    
	  return
	)

	# login handler
	$('.login').click (e) ->
		auth.login 'facebook', {remember_me: true}
		return e.preventDefault

	###
	$('#add').click () ->
		url = dbRef + 'users'
		promise = angularFire(url, $scope, 'users', []);
		promise.then () ->
			$scope.users.push {username:"adsdfsdfddd"}
			console.log 'added adsdfsfdddddd'
			return
		return false
	###

	return
])
