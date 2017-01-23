class Vote < ActiveRecord::Base
  enum value: [:like, :dislike]
  belongs_to :joke

  validates_presence_of :value, in: values.keys
end
