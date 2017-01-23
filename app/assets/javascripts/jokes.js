function JokeHelper(scope, http, cookies) {
  this.scope = scope;
  this.http = http;
  this.cookies = cookies;
}

JokeHelper.prototype.getRandomJoke = function() {
  $this = this;

  $this.http({
    method: 'GET',
    url: '/jokes/random'
  }).then(function successCallback(resp) {
    $this.scope.joke = resp.data;
  }, function errorCallback(resp) {
    console.log(resp.error);
  })
}

JokeHelper.prototype.vote = function(status, joke,  callback) {
  joke = joke;
  http = this.http;
  cookies = this.cookies;
  $this = this

  http({
    method: 'POST',
    url: 'votes',
    data: {
      joke_id: joke.id,
      value: status
    }
  }).then(function successCallback(resp) {
    cookies.put("vote-for-" + joke.id, status);
    $this.getRandomJoke();
  })
}

$(document).ready(function() {
  jokee = angular.module('Jokee',[
    'ngCookies'
  ]).
    controller('JokeCtrl', function($scope, $http, $cookies){

      jokeHelper = new JokeHelper($scope, $http, $cookies);
      jokeHelper.getRandomJoke();

      $scope.like = function(joke) {
        new JokeHelper($scope, $http, $cookies).vote('like', $scope.joke);
      }

      $scope.dislike = function(joke) {
        new JokeHelper($scope, $http, $cookies).vote('dislike', $scope.joke);
      }
    }).
    run(function() {
      console.log('run')
    })
})
