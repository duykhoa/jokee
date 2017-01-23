class Joke < ActiveRecord::Base
  scope :except_ids, -> (ids) { where.not(id: ids )}
  scope :first_item, -> { limit(1) }

  validates_presence_of :content

  def self.not_in(ids)
    except_ids(ids).first_item.first
  end
end
