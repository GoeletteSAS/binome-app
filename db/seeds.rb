require 'faker'
require 'open-uri'

puts 'Cleaning database...'
Search.destroy_all
Experience.destroy_all
User.destroy_all

puts 'Creating users...'
users = []

4.times do
  users << User.create!(first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        username: Faker::Internet.username,
                        email: Faker::Internet.email,
                        password: "password",
                        date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65)
                        )
end

puts 'Creating experiences...'
experiences = []

experience1 = Experience.create!(
    user: users[0],
    start_date: Faker::Date.backward(days: rand(365..1825)), # Random start date within 5 years
    end_date: [Faker::Date.backward(days: rand(0..364)), nil].sample,
    is_current: Faker::Boolean.boolean,
    line_of_work: Faker::Job.field,
    field: Faker::Job.position,
    address: Faker::Address.full_address
  )
experiences << experience1

experience2 = Experience.create!(
  user: users[1],
  start_date: Faker::Date.backward(days: rand(365..1825)),
  end_date: [Faker::Date.backward(days: rand(0..364)), nil].sample,
  is_current: Faker::Boolean.boolean,
  line_of_work: Faker::Job.field,
  field: Faker::Job.position,
  address: Faker::Address.full_address
)
experiences << experience2

experience3 = Experience.create!(
  user: users[2],
  start_date: Faker::Date.backward(days: rand(365..1825)),
  end_date: [Faker::Date.backward(days: rand(0..364)), nil].sample,
  is_current: Faker::Boolean.boolean,
  line_of_work: Faker::Job.field,
  field: Faker::Job.position,
  address: Faker::Address.full_address
)
experiences << experience3

experience4 = Experience.create!(
  user: users[3],
  start_date: Faker::Date.backward(days: rand(365..1825)),
  end_date: [Faker::Date.backward(days: rand(0..364)), nil].sample,
  is_current: Faker::Boolean.boolean,
  line_of_work: Faker::Job.field,
  field: Faker::Job.position,
  address: Faker::Address.full_address
)
experiences << experience4

puts 'Creating searches...'
search1 = Search.new(user: users[0],
  experience: experiences.sample,
  line_of_work: Faker::Job.field,
  field: Faker::Job.position,
  address: Faker::Address.full_address,
  is_offering: Faker::Boolean.boolean
)

search2 = Search.new(user: users[1],
  experience: experiences.sample,
  line_of_work: Faker::Job.field,
  field: Faker::Job.position,
  address: Faker::Address.full_address,
  is_offering: Faker::Boolean.boolean
)

search3 = Search.new(user: users[2],
  experience: experiences.sample,
  line_of_work: Faker::Job.field,
  field: Faker::Job.position,
  address: Faker::Address.full_address,
  is_offering: Faker::Boolean.boolean
)

search4 = Search.new(user: users[3],
  experience: experiences.sample,
  line_of_work: Faker::Job.field,
  field: Faker::Job.position,
  address: Faker::Address.full_address,
  is_offering: Faker::Boolean.boolean
)

search1.save!
search2.save!
search3.save!
search4.save!

users << User.create!(first_name: "Juliette",
  last_name: "Voilatipa",
  username: "juju",
  email: "juliette.voilatipa@yahoo.fr",
  password: "password",
  date_of_birth: "1990-09-13"
  )

Experience.create!(
    user: users[4],
    start_date: "2020-02-02",
    is_current: true,
    line_of_work: "ventes",
    field: "Imprimerie",
    address: "3 Allier"
  )

puts 'Seed complete! 🎉'
