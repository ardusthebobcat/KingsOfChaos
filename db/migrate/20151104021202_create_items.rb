class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :base, :default => 1 #base attack/base_defense
      t.boolean :stat_type #attack =true, defense = false
      t.integer :quantity, :default => 1

      #for the belongs_to
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
