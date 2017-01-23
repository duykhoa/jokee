require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "with value" do
    it "is a like vote" do
      vote = Vote.create(value: 0)
      expect(vote.like?).to be true
    end

    it "is a dislike vote" do
      vote = Vote.create(value: 1)
      expect(vote.dislike?).to be true
    end
  end
end
