require 'rails_helper'

describe VotesController, type: :controller do
  describe "#create" do
    it "successfully create like vote" do
      params = {
        value: 'like',
        joke_id: 1
      }

      resp = post :create, vote: params
      expect(resp.status).to eq 200
    end

    it "successfully create dislike vote" do
      params = {
        value: 'dislike',
        joke_id: 1
      }

      resp = post :create, vote: params
      expect(resp.status).to eq 200
    end

    it "unsuccessfully" do
      params = {
        joke_id: 1,
        value: 'asdfasdfa'
      }

      resp = post :create, vote: params
      expect(resp.status).to eq 500
    end
  end
end
