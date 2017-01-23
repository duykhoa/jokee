class JokesController < ApplicationController
  # GET /jokes
  # GET /jokes.json
  def index
    @joke = Joke.first
  end

  def random
    @joke = Joke.last
    render json: @joke
  end
end
