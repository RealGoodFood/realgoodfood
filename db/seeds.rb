# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

FoodCategory.create(:name => 'Main')
FoodCategory.create(:name => 'Side')
FoodCategory.create(:name => 'Dessert')
FoodCategory.create(:name => 'Sauce/Dressing/Curry')
FoodCategory.create(:name => 'Fresh Ingredients')

Value.create(:name=>'Organic')
Value.create(:name=>'Local')
Value.create(:name=>'Vegeterian')
Value.create(:name=>'Vegan')
Value.create(:name=>'Dairy-free')
Value.create(:name=>'Gluten-free')
Value.create(:name=>'Homegrown')
Value.create(:name=>'Farmers Market')
Value.create(:name=>'CSA')
Value.create(:name=>'Conventional')
Value.create(:name=>'Grass Fed')
Value.create(:name=>'Free Range')
Value.create(:name=>'Peanut Safe')

EatByDate.create(:name=>'shelf stable')
EatByDate.create(:name=>'Freezer')
EatByDate.create(:name=>'Fridge')
EatByDate.create(:name=>'Room Temperature')

Role.create(:name => 'admin')
Role.create(:name => 'guest user')
#Tag.create(:name=>'Local')
#Tag.create(:name=>'Vegeterian')
#Tag.create(:name=>'Vegan')
#Tag.create(:name=>'Dairy-free')
#Tag.create(:name=>'Gluten-free')
#Tag.create(:name=>'Homegrown')
#Tag.create(:name=>'Farmers Market')
#Tag.create(:name=>'CSA')
#Tag.create(:name=>'Conventional')
#Tag.create(:name=>'Grass Fed')
#Tag.create(:name=>'Free Range')
#Tag.create(:name=>'Peanut Safe')
