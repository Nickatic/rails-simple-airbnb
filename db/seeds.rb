# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Flat.destroy_all
require 'open-uri'
require 'json'
urls = []
6.times {
  url = "https://api.unsplash.com/photos/random/?client_id=5fe258ea2bd9e5e5444ddbbc3a8bb538be5d7b41a518e87cf394221cd9b236ba&query=appartment"
  json = open(url).read
  objs = JSON.parse(json)
  urls << objs["urls"]["raw"]
}

puts 'Creating flats...'

flats_attributes = [
  {
    name:         'Dishoom',
    address:      'London',
    description: 'Nice flat',
    number_of_guests:     rand(2..6),
    price_per_night: rand(30..100),
    img_url: urls[0]
  },
  {
    name:         'Pizza East',
    address:      'London',
    description: 'Nice flat',
    number_of_guests:     rand(2..6),
    price_per_night: rand(30..100),
    img_url: urls[1]
  },
  {
    name:         'Mamma Roma',
    address:      'Oberkampf',
    description: 'Nice flat',
    number_of_guests:     rand(2..6),
    price_per_night: rand(30..100),
    img_url: urls[2]
  },
  {
    name:         "Barbue d'anvers",
    address:      'Lille',
    description: 'Nice flat',
    number_of_guests:     rand(2..6),
    price_per_night: rand(30..100),
    img_url: urls[3]
  },
  {
    name:         'Nihao',
    address:      'Paris',
    description: 'Nice flat',
    number_of_guests:     rand(2..6),
    price_per_night: rand(30..100),
    img_url: urls[4]
  },
  {
    name:         'Le bonjour',
    address:      'Perpette-les-oies',
    description: 'Nice flat',
    number_of_guests:     rand(2..6),
    price_per_night: rand(30..100),
    img_url: urls[5]
  }
]
Flat.create!(flats_attributes)
puts 'Finished!'
