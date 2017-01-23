class Vote < ActiveRecord::Base
  enum value: [:like, :dislike]
end
