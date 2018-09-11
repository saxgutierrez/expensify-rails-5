require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categoria1 = Category.create(name:"Restaurants") #category_id=1
categoria2 = Category.create(name:"Grocery")	 #category_id=2
categoria3 = Category.create(name:"Car")		 #category_id=3
categoria4 = Category.create(name:"Services")	 #category_id=4
categoria5 = Category.create(name:"Home")		 #category_id=5
categoria6 = Category.create(name:"Education")	 #category_id=6
categoria7 = Category.create(name:"Fun")		 #category_id=7
categoria8 = Category.create(name:"Travel")	 	 #category_id=8

tipo1 = Type.create(name:"Purchase") 			 #type_id=1
tipo2 = Type.create(name:"Withdrawal")			 #type_id=2
tipo3 = Type.create(name:"Transfer")			 #type_id=3
tipo4 = Type.create(name:"Payment")				 #type_id=4

#si sirve
(1..8).each do |i|
	(1..4).each do |j|
		(10).times do
			Expense.create!(category_id:i, type_id:j,
			 concept:Faker::Beer.name ,
			 date: Faker::Date.between(1.year.ago, Date.today) ,
			 amount:Faker::Bank.account_number)
		end
	end
end
