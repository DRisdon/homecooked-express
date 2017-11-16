# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  Dinner.create(starts_at: '2017-11-15 19:30:00', location: '490 West End Ave', host_id: 1)
  Dinner.create(starts_at: '2017-11-16 19:00:00', location: '490 West End Ave', host_id: 1)
  Dinner.create(starts_at: '2017-11-17 19:00:00', location: '490 West End Ave', host_id: 1)
  Dinner.create(starts_at: '2017-11-18 19:00:00', location: '490 West End Ave', host_id: 1)
  Dinner.create(starts_at: '2017-11-19 19:00:00', location: '490 West End Ave', host_id: 1)
  Dinner.create(starts_at: '2017-11-20 19:00:00', location: '490 West End Ave', host_id: 1)
  Dinner.create(starts_at: '2017-11-21 19:00:00', location: '490 West End Ave', host_id: 1)
  puts "dinners created"


  AttendeeDinner.create(attendee_id: 2, dinner_id: 1)
  AttendeeDinner.create(attendee_id: 2, dinner_id: 4)
  Invite.create(invited_id: 2, dinner_id: 3)

  puts "attendees added"
