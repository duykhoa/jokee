class JokesController < ApplicationController
  # GET /jokes
  # GET /jokes.json
  def index
  end

  def random
    @joke = Joke.where.not(id: votes_joke_ids).limit(1).first
    render json: @joke
  end

  def votes_joke_ids
    cookies.select { |key, value| key.match(/vote-for-.*/) }.map { |ite| ite[0].split('-')[-1] }
  end
end
