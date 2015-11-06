class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :base, :default => 1 #base attack/base_defense
      t.boolean :stat_type #attack =true, defense = false
      t.integer :cost

      t.timestamps null: false
    end
  end
end
