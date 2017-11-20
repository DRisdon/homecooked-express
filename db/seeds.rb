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

  puts "attendees created"

  Recipe.create(
    dinner_id: 1,
    name: 'Teriyaki Chicken',
    source: 'David Lebovitz',
    recipe_url: 'http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/',
    image_url: 'https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg',
    ingredients: '1/2 cup (125ml) mirin; 1/2 cup (125ml) soy sauce; One 2-inch (5cm) piece of fresh ginger, peeled and grated; 2-pounds (900g) boneless chicken thighs (4-8 thighs, depending on size)'
  )
  Recipe.create(
    dinner_id: 2,
    name: 'Teriyaki Chicken',
    source: 'David Lebovitz',
    recipe_url: 'http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/',
    image_url: 'https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg',
    ingredients: '1/2 cup (125ml) mirin; 1/2 cup (125ml) soy sauce; One 2-inch (5cm) piece of fresh ginger, peeled and grated; 2-pounds (900g) boneless chicken thighs (4-8 thighs, depending on size)'
  )
  Recipe.create(
    dinner_id: 3,
    name: 'Teriyaki Chicken',
    source: 'David Lebovitz',
    recipe_url: 'http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/',
    image_url: 'https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg',
    ingredients: '1/2 cup (125ml) mirin; 1/2 cup (125ml) soy sauce; One 2-inch (5cm) piece of fresh ginger, peeled and grated; 2-pounds (900g) boneless chicken thighs (4-8 thighs, depending on size)'
  )
  Recipe.create(
    dinner_id: 4,
    name: 'Teriyaki Chicken',
    source: 'David Lebovitz',
    recipe_url: 'http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/',
    image_url: 'https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg',
    ingredients: '1/2 cup (125ml) mirin; 1/2 cup (125ml) soy sauce; One 2-inch (5cm) piece of fresh ginger, peeled and grated; 2-pounds (900g) boneless chicken thighs (4-8 thighs, depending on size)'
  )
  Recipe.create(
    dinner_id: 5,
    name: 'Teriyaki Chicken',
    source: 'David Lebovitz',
    recipe_url: 'http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/',
    image_url: 'https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg',
    ingredients: '1/2 cup (125ml) mirin; 1/2 cup (125ml) soy sauce; One 2-inch (5cm) piece of fresh ginger, peeled and grated; 2-pounds (900g) boneless chicken thighs (4-8 thighs, depending on size)'
  )
  Recipe.create(
    dinner_id: 6,
    name: 'Teriyaki Chicken',
    source: 'David Lebovitz',
    recipe_url: 'http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/',
    image_url: 'https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg',
    ingredients: '1/2 cup (125ml) mirin; 1/2 cup (125ml) soy sauce; One 2-inch (5cm) piece of fresh ginger, peeled and grated; 2-pounds (900g) boneless chicken thighs (4-8 thighs, depending on size)'
  )
  Recipe.create(
    dinner_id: 7,
    name: 'Teriyaki Chicken',
    source: 'David Lebovitz',
    recipe_url: 'http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/',
    image_url: 'https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg',
    ingredients: '1/2 cup (125ml) mirin; 1/2 cup (125ml) soy sauce; One 2-inch (5cm) piece of fresh ginger, peeled and grated; 2-pounds (900g) boneless chicken thighs (4-8 thighs, depending on size)'
  )

  puts "recipes created"
