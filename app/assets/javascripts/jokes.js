function Joke(id) {
  this.id = id;
}

Joke.prototype.like = function() {
}

Joke.prototype.dislike = function() {
}

$(document).ready(function() {
  $('.like').on('click', function(e) {
    e.preventDefault();
    new Joke().like();
  })

  $('.dislike').on('click', function(e) {
    e.preventDefault();
    new Joke().dislike();
  })
})
