require 'rails_helper'

describe VotesController, type: :controller do
  describe "#create" do
    it "successfully create like vote" do
      params = {
        value: 'like'
      }

      resp = post :create, vote: params
      expect(resp.status).to eq 200
    end

    it "successfully create dislike vote" do
      params = {
        value: 'dislike'
      }

      resp = post :create, vote: params
      expect(resp.status).to eq 200
    end

    it "unsuccessfully" do
      params = {
        value: 'asdfasdfa'
      }

      resp = post :create, vote: params
      expect(resp.status).to eq 500
    end
  end
end
