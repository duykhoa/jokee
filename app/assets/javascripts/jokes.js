function JokeHelper(joke, http, cookies) {
  this.joke = joke;
  this.http = http;
  this.cookies = cookies;
}

JokeHelper.prototype.vote = function(status, callback) {
  joke = this.joke;
  http = this.http;
  cookies = this.cookies;

  http({
    method: 'POST',
    url: 'votes',
    data: {
      joke_id: joke.id,
      value: status
    }
  }).then(function successCallback(resp) {
    cookies.put("vote-for-" + joke.id, status);
  })
}

$(document).ready(function() {
  jokee = angular.module('Jokee',[
    'ngCookies'
  ]).
    controller('JokeCtrl', function($scope, $http, $cookies){
      $http({
        method: 'GET',
        url: '/jokes/random'
      }).then(function successCallback(resp) {
        $scope.joke = resp.data;
      }, function errorCallback(resp) {
        console.log(resp.error);
      })


      $scope.like = function(joke) {
        new JokeHelper($scope.joke, $http, $cookies).vote('like');
      }

      $scope.dislike = function(joke) {
        new JokeHelper($scope.joke, $http, $cookies).vote('dislike');
      }
    }).
    run(function() {
      console.log('run')
    })
})
