class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # User Account/ Auth stuff
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :password_salt

      #Stats
      t.integer :untrained, default: 50
      t.integer :trained, default: 0
      t.integer :spy, default: 0

      #currency
      t.integer :total_gold, default: 15000
      t.integer :turns, default: 15

      t.timestamps null: false
    end
  end
end
