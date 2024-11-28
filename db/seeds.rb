require 'faker'
require 'open-uri'

puts 'Cleaning database...'
Search.destroy_all
Experience.destroy_all
User.destroy_all

# base de données expériences et search

LINES_OF_WORK = [
  "ventes",
  "production",
  "achats",
  "maintenance",
  "logistique",
  "marketing",
  "comptabilité",
  "contrôle de gestion",
  "trésorerie"
]

FIELDS = [
  "Agroalimentaire",
  "Banque & Assurance",
  "Bois, Papier & Carton",
  "Imprimerie",
  "BTP",
  "Matériaux de construction",
  "Chimie & Parachimie",
  "Commerce, Négoce & Distribution",
  "Édition, Communication & Multimédia",
  "Électronique & Électricité",
  "Études et conseils",
  "Industrie pharmaceutique",
  "Informatique & Télécoms",
  "Machines et équipements & Automobile",
  "Métallurgie & Travail du métal",
  "Plastique & Caoutchouc",
  "Services-aux-entreprises",
  "Textile, Habillement & Chaussure",
  "Transports & Logistique"
]

FRENCH_CITIES = [
  "Paris", "Lyon", "Marseille", "Toulouse", "Nice", "Nantes",
  "Strasbourg", "Montpellier", "Bordeaux", "Lille", "Rennes",
  "Reims", "Saint-Étienne", "Toulon", "Le Havre", "Grenoble",
  "Dijon", "Angers", "Nîmes", "Villeurbanne"
]


puts 'Creating users...'
users = []

# users figés
users << User.create!(
  first_name: "Baudoin",
  last_name: "De Bayser",
  username: "baudoin92",
  email: "baudoin@baudoin.fr",
  password: "password",
  date_of_birth: Date.new(1992, 8, 25)
)

users << User.create!(
  first_name: "Odile",
  last_name: "Fayad",
  username: "odile93",
  email: "odile@odile.fr",
  password: "password",
  date_of_birth: Date.new(1993, 12, 7)
)

users << User.create!(
  first_name: "Santiana",
  last_name: "Irakoze",
  username: "santiana98",
  email: "santiana@santiana.fr",
  password: "password",
  date_of_birth: Date.new(1998, 8, 7)
)

# users générés

100.times do
  users << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password:"password",
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
end

puts 'Creating experiences...'
experiences = []

# experiences figés

experience1 = Experience.create!(
  user: users[0],
  start_date: Date.new(2020, 9, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "contrôle de gestion",
  field: "Agroalimentaire",
  address: "Paris, France",
  latitude: 48.856613,
  longitude: 2.352222
)
experiences << experience1

experience2 = Experience.create!(
  user: users[1],
  start_date: Date.new(2019, 3, 15),
  end_date: Date.new(2023, 12, 31),
  is_current: false,
  line_of_work: "marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Lyon, France",
  latitude: 45.764043,
  longitude: 4.835659
)
experiences << experience2

experience3 = Experience.create!(
  user: users[2],
  start_date: Date.new(2021, 6, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "maintenance",
  field: "Machines et équipements & Automobile",
  address: "Bordeaux, France",
  latitude: 44.837789,
  longitude: -0.57918
)
experiences << experience3

# experiences générés
100.times do
  experiences << Experience.create!(
    user: users.sample,
    start_date: Faker::Date.backward(days: rand(365..1825)),
    end_date: [Faker::Date.backward(days: rand(0..364)), nil].sample,
    is_current: Faker::Boolean.boolean,
    line_of_work: LINES_OF_WORK.sample,
    field: FIELDS.sample,
    address: "#{FRENCH_CITIES.sample}, France"
  )
end


puts 'Creating searches...'
searches = []

searches <<  Search.new(user: users[0],
  experience: experiences.sample,
  line_of_work: LINES_OF_WORK.sample,
  field: FIELDS.sample,
  address: Faker::Address.full_address,
  is_offering: Faker::Boolean.boolean
)

searches <<  Search.new(user: users[1],
  experience: experiences.sample,
  line_of_work: LINES_OF_WORK.sample,
  field: FIELDS.sample,
  address: Faker::Address.full_address,
  is_offering: Faker::Boolean.boolean
)

searches <<  Search.new(user: users[2],
  experience: experiences.sample,
  line_of_work: LINES_OF_WORK.sample,
  field: FIELDS.sample,
  address: Faker::Address.full_address,
  is_offering: Faker::Boolean.boolean
)

# searches générés
100.times do
  searches << Search.create!(
    user: users.sample,
    experience: experiences.sample,
    line_of_work: LINES_OF_WORK.sample,
    field: FIELDS.sample,
    address: "#{FRENCH_CITIES.sample}, France",
    is_offering: Faker::Boolean.boolean
  )
end

# users << User.create!(first_name: "Juliette",
#   last_name: "Voilatipa",
#   username: "juju",
#   email: "juliette.voilatipa@yahoo.fr",
#   password: "password",
#   date_of_birth: "1990-09-13"
#   )

# Experience.create!(
#     user: users[4],
#     start_date: "2020-02-02",
#     is_current: true,
#     line_of_work: "ventes",
#     field: "Imprimerie",
#     address: "3 Allier"
#   )
#  s
puts 'Seed complete! 🎉'
