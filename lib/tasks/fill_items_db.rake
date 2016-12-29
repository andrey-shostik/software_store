require 'faker'

namespace :db do
  desc 'Fill database with user data'
  task populate_items: :environment do
    10.times do |n|
      name = Faker::App.name
      description = Faker::Lorem.paragraphs(1)
      price = Faker::Commerce.price
      Item.create!(name:      	name,
                   description: description,
                   price:  			price)
    end
  end
end
