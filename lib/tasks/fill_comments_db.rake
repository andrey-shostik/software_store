require 'faker'

namespace :db do
  desc 'Fill database with user data'
  task populate_comments: :environment do
    50.times do |n|
      item_id = Item.all.select(:id).sample.id
      body = Faker::Lorem.sentence(3, true)
      Comment.create!(body:    body,
                   item_id: item_id)
    end
  end
end
