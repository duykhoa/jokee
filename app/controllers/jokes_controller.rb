class JokesController < ApplicationController
  # GET /jokes
  # GET /jokes.json
  def index
    @jokes = Joke.all
  end
end
