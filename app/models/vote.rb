class Vote < ActiveRecord::Base
  enum value: [:like, :dislike]
  belongs_to :joke
end
