class Joke < ActiveRecord::Base
  scope :except_ids, lambda { |ids| where.not(id: ids )}
  scope :first_item, lambda { limit(1) }

  def self.not_in(ids)
    except_ids(ids).first_item.first
  end
end
