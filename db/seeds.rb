require 'faker'
require 'open-uri'

puts 'Cleaning database...'
Favorite.destroy_all
Search.destroy_all
Experience.destroy_all
User.destroy_all

# base de données expériences et search

LINES_OF_WORK = [
  "Ventes",
  "Production",
  "Marketing"
]

FIELDS = [
  "Services-aux-entreprises",
  "Textile, Habillement & Chaussure",
  "Transports & Logistique"
]

FRENCH_CITIES = [
  "Paris", "Lyon", "Marseille"
]

puts 'Creating users and experiences....'
users = []
experiences = []
searches = []

# users & experiences figés

puts "creating Pascal"

users << User.create!(
  first_name: "Pascal",
  last_name: "Auribaud",
  username: "Pascal92",
  email: "pascal@hotmail.fr",
  password: "password",
  date_of_birth: Date.new(1992, 8, 25)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1733134021/istockphoto-498256634-612x612_wnckma.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2020, 9, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Ventes",
  field: "Textile, Habillement & Chaussure",
  address: "Paris, France",
  latitude: 48.856613,
  longitude: 2.352222
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Virginie"
users << User.create!(
  first_name: "Virginie",
  last_name: "Bonnet",
  username: "Virginie73",
  email: "Virginie@holiday.fr",
  password: "password",
  date_of_birth: Date.new(1973, 12, 7)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1732812152/rsbcsegxvjbqumd5vuvt.png").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2019, 3, 15),
  end_date: nil,
  is_current: true,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Lyon, France",
  latitude: 45.764043,
  longitude: 4.835659
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Sophie"

users << User.create!(
  first_name: "Sophie",
  last_name: "Ianila",
  username: "Sophie98",
  email: "sophie@yahoo.fr",
  password: "password",
  date_of_birth: Date.new(1984, 8, 7)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1732812026/okuu9ml6soz8xm1tsgqk.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2021, 6, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Ventes",
  field: "Transports & Logistique",
  address: "Paris, France",
  latitude: 44.837789,
  longitude: -0.57918
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Justin"

users << User.create!(
  first_name: "Justin",
  last_name: "Bridou",
  username: "Surfing_Justin",
  email: "justin@bridao.fr",
  password: "password",
  date_of_birth: Date.new(1994, 8, 7)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1732811206/samples/smile.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2015, 6, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Production",
  field: "Textile, Habillement & Chaussure",
  address: "Lyon, France",
  latitude: 44.837789,
  longitude: -0.57918
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Stéphane"

users << User.create!(
  first_name: "Stéphane",
  last_name: "Jacquot",
  username: "StephaneJ",
  email: "Stephane@wanadoo.fr",
  password: "password",
  date_of_birth: Date.new(1970, 8, 25)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1733134021/St%C3%A9phane_qxhsn4.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2003, 9, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "ventes",
  field: "Services-aux-entreprises",
  address: "Paris, France",
  latitude: 48.856613,
  longitude: 2.352222
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Pauline"

users << User.create!(
  first_name: "Pauline",
  last_name: "Forcet",
  username: "Paulinette",
  email: "pauline@gmail.com",
  password: "password",
  date_of_birth: Date.new(1985, 12, 7)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1733134021/1000_F_105632490_xr18ylLjgVkBhgwu7MefPDN7PjmyAqSy_dhubdi.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2016, 3, 15),
  end_date: nil,
  is_current: true,
  line_of_work: "Marketing",
  field: "Textile, Habillement & Chaussure",
  address: "Lyon, France",
  latitude: 45.764043,
  longitude: 4.835659
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Maiza"

users << User.create!(
  first_name: "Maizena",
  last_name: "Tiroud",
  username: "TiMaiza",
  email: "maiza@hourra.fr",
  password: "password",
  date_of_birth: Date.new(1987, 8, 7)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1733134196/istockphoto-914875306-612x612_mz6b5g.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2022, 6, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Production",
  field: "Transports & Logistique",
  address: "Lyon, France",
  latitude: 44.837789,
  longitude: -0.57918
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Justine"

users << User.create!(
  first_name: "Justine",
  last_name: "Tacquillard",
  username: "justine_HUG",
  email: "justine@hodao.fr",
  password: "password",
  date_of_birth: Date.new(1984, 8, 7)
)

photo = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1732812166/txv5zwjqk3chyv5dozzf.jpg").open
User.last.photo.attach(io: photo, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

experiences << Experience.create!(
  user: users.last,
  start_date: Date.new(2015, 6, 1),
  end_date: nil,
  is_current: true,
  line_of_work: "Production",
  field: "Transports & Logistique",
  address: "Lyon, France",
  latitude: 44.837789,
  longitude: -0.57918
)

searches << Search.create!(
  user: users.last,
  experience: experiences.last,
  line_of_work: experiences.last.line_of_work,
  field: experiences.last.field,
  address: experiences.last.address,
  is_offering: true
)

puts "creating Juliette"

users << User.create!(
  first_name: "Juliette",
  last_name: "Voilatipa",
  username: "juju",
  email: "juliette.voilatipa@yahoo.fr",
  password: "password",
  date_of_birth: "1990-09-13"
)
photojuliette = URI.parse("https://res.cloudinary.com/deti40pff/image/upload/c_thumb,w_200,g_face/v1732812190/k77ntqucqxeverih1qlr.jpg").open
User.last.photo.attach(io: photojuliette, filename: "#{User.last.first_name}-#{User.last.last_name}-photo.jpg", content_type: "image/jpg")
User.last.save

Experience.create!(
    user: User.last,
    start_date: "2020-02-02",
    is_current: true,
    line_of_work: "mMrketing",
    field: "Textile, Habillement & Chaussure",
    address: "Paris, France"
  )

Search.create!(
  user: User.last,
  address: "Lyon, France",
  field: "Textile, Habillement & Chaussure",
  line_of_work: "Marketing",
  is_offering: false,
)

Search.create!(
  user: User.last,
  address: "Paris, France",
  field: "Textile, Habillement & Chaussure",
  line_of_work: "Ventes",
  is_offering: false,
)
puts 'Seed complete! 🎉'
