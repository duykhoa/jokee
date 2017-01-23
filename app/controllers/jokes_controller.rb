class JokesController < ApplicationController
  # GET /jokes
  # GET /jokes.json
  def index
  end

  def random
    @joke = Joke.not_in(voted_joke_ids)

    if @joke
      render json: @joke
    else
      render json: { error: "no more joke" }, status: 204
    end
  end

  private

  def voted_joke_ids
    VotedJokeIdsFromCookies.new(cookies).ids
  end
end
