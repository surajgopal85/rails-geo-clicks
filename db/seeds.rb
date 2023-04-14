# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts("destroying all clicks...")
Click.destroy_all
puts("still working...")
puts("...")
puts("rebuilding db")
Click.create!(name: "Flatiron Building", address: "175 5th Ave, New York, NY 10010")
Click.create!(name: "The Getty Center", address: "200 Getty Center Dr, Los Angeles, CA 90049, USA")
Click.create!(name: "Livrustkammaren", address: "Slottsbacken 3, 111 30 Stockholm, Sweden")
Click.create!(name: "Signal Iduna Park", address: "Strobelallee 50, 44139 Dortmund, Germany")
puts("finished!")
