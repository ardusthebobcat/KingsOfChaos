# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin Account seed
#User.create(email: 'admin@admin.com', password: 'admin', username: 'SpriteRemix')

#"NPC" Account seeds


#Test Item seeds
Item.create({user_id: 1, base: 50000, quantity: 5, stat_type: 'true', name: 'Poison Fang Sword'})
