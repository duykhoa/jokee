class VotesController < ApplicationController
  def create
    if vote = Vote.create(vote_params)
      render json: vote
    else
      render json: { error: "there is an error" }, status: :unprocessable_entity
    end
  end

  def vote_params
    params.require(:vote).permit(:value).tap do |params|
      params[:value] = params[:value].to_i
    end
  end
end
