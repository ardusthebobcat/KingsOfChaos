class Item < ActiveRecord::Base
  belongs_to :user
  validates :name, :stat_type, presence: true
  attr_accessor :add_quantity
  attr_accessor :stat_sum


  def add_quantity(count)
    self.quantity = self.quantity + count
  end

  def stat_sum
    stat_sum =(self.base * self.quantity)
  end
end
