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

  describe "validates value" do
    it "is valid" do
      vote = Vote.new(value: 'like')
      expect(vote.valid?).to be true
    end

    it "isn't valid" do
      expect{ Vote.new(value: 'love') }.to raise_error ArgumentError
    end

    it "isn't valid with empty content" do
      expect(Vote.new().valid?).to be false
    end
  end
end
