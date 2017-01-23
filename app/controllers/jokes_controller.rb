class JokesController < ApplicationController
  # GET /jokes
  # GET /jokes.json
  def index
  end

  def random
    @joke = Joke.not_in(voted_joke_ids)

    render json: @joke
  end

  private

  def voted_joke_ids
    VotedJokeIdsFromCookies.new(cookies).ids
  end
end
