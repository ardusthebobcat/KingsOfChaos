class ExtraUserColumns < ActiveRecord::Migration
  def change
    add_column :users, :attack_level , :integer, default: 1
    add_column :users, :defense_level , :integer, default: 1
    add_column :users, :spy_level , :integer, default: 1

    add_column :users, :unit_production , :integer, default: 1
  end
end
