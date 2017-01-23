class VotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    with_error_hander do
      vote = Vote.new(vote_params)
      if vote.save
        render json: vote, status: 200
      else
        render json: { error: "Can't create vote" }, status: 422
      end
    end
  end

  def vote_params
    params.require(:vote).permit(:value, :joke_id)
  end

  def with_error_hander(&block)
    begin
      block.call
    rescue ArgumentError => e
      render json: { error: e.message }, status: 500
    end
  end
end
