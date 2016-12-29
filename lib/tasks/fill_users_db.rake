require 'faker'

namespace :db do
  desc 'Fill database with user data'
  task populate_users: :environment do
    Rake::Task['db:reset'].invoke
    50.times do |n|
      email = Faker::Internet.free_email
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      phone_number = Faker::Base.numerify('+380#########')
      password = Faker::Internet.password
      city = Faker::Address.city
      User.create!(email:      email,
                   first_name: first_name,
                   last_name:  last_name,
                   phone_number: phone_number,
                   password:   password,
                   city:       city)
    end
  end
end
