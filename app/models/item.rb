class Item < ActiveRecord::Base
  validates :name, :stat_type, presence: true
  attr_accessor :stat_sum
end
