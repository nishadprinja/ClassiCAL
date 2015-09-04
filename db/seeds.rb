# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'ffaker'

User.create({
	first_name: "Rachelle",
	last_name: "Faroul",
	username: "rfaroul",
	graduation_year: 2019
})

User.create({
	first_name: "Simone",
	last_name: "Sobers",
	username: "soberss",
	graduation_year: 2018
})

User.create({first_name: "Grace",
	last_name: "Hackett",
	username: "ghackett",
	graduation_year: 2017
})