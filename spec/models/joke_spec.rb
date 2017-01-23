require 'rails_helper'

describe Joke, type: :model do
  describe "not_in" do
    it "returns 1 records" do
      joke = Joke.create(content: 'test content')

      resp = Joke.not_in([-1])
      expect(resp).to be_a Joke
    end

    it "returns nil" do
      resp = Joke.not_in([-1])
      expect(resp).to be nil
    end
  end

  describe "can't create joke with out content" do
    it do
      joke = Joke.new
      expect(joke.save).to be false
    end
  end
end
