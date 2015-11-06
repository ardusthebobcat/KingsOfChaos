class UsersHstoreItems < ActiveRecord::Migration
  def change
    enable_extension 'hstore'
    add_column :users, :attack_items, :hstore
      add_index :users, :attack_items, using: :gin
    add_column :users, :defense_items, :hstore
      add_index :users, :defense_items, using: :gin
          
  end
end
