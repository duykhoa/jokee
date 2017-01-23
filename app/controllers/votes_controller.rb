class VotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    begin
      vote = Vote.new(vote_params)

      if vote.save
        render json: vote, status: 200
      else
        render json: { error: "" }, status: 503
      end
    rescue ArgumentError => e
      render json: { error: e.message }, status: 500
    end
  end

  def vote_params
    params.require(:vote).permit(:value, :joke_id)
  end
end
