require 'rails_helper'

describe VotesController, type: :controller do
  describe "#create" do
    it "successfully" do
      params = {
        value: 1
      }

      post :create, vote: params
    end
  end
end
