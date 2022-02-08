# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Person.destroy_all
Role.destroy_all
# Generate models and tables, according to the domain model
# TODO!
#completed in terminal with rails generate model and rails db:migrate
# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!


person=Person.new({name: "Christopher Nolan"})
person.save

nolan=Person.where({name: "Christopher Nolan"})[0]
puts "The id is #{nolan.id}"

person1=Person.new({name: "Christian Bale"})
person1.save

person2=Person.new({name: "Michael Caine"})
person2.save

person3=Person.new({name: "Liam Neeson"})
person3.save

person4=Person.new({name: "Katie Holmes"})
person4.save

person5=Person.new({name: "Gary Oldman"})
person5.save

person6=Person.new({name: "Heath Ledger"})
person6.save

person7=Person.new({name: "Aaron Eckhart"})
person7.save

person8=Person.new({name: "Maggie Gyllenhaal"})
person8.save

person9=Person.new({name: "Tom Hardy"})
person9.save

person10=Person.new({name: "Joseph Gordon-Levitt"})
person10.save

person11=Person.new({name: "Anne Hathaway"})
person11.save



movie1= Movie.new({ title: "Batman Begins", year_released: 2005, rated: "PG-13", person_id:nolan.id})
movie1.save

movie2= Movie.new({ title: "The Dark Knight", year_released: 2008, rated: "PG-13", person_id:nolan.id})
movie2.save

movie3= Movie.new({ title: "The Dark Knight Rises", year_released: 2012, rated: "PG-13", person_id:nolan.id})
movie3.save


role=Role.new({movie_id: movie1.id, person_id: person1.id, character_name: "Bruce Wayne"})
role.save

role=Role.new({movie_id: movie1.id, person_id: person2.id, character_name: "Alfred"})
role.save

role=Role.new({movie_id: movie1.id, person_id: person3.id, character_name: "Ra's Al Ghul"})
role.save

role=Role.new({movie_id: movie1.id, person_id: person4.id, character_name: "Rachel Dawes"})
role.save

role=Role.new({movie_id: movie1.id, person_id: person5.id, character_name: "Commissioner Gordon"})
role.save



# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!
movies = Movie.all

puts "There are #{Movie.all.count} movies"



for movie in movies
    director = Person.where({id: movie.person_id})[0]
    puts "#{movie.title} #{movie.year_released} #{movie.rated} #{director.name} "
#    puts "#{movie.director.count}"
end


people = Person.all
#puts "There are #{Person.all.count} people"

roles=Role.all
#puts "there are #{Role.all.count} roles"

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!
for role in roles
    actor = Person.where({id:role.person_id})[0]
    film= Movie.where({id:role.movie_id})[0]
    puts "#{film.title} #{actor.name} #{role.character_name}"
#    puts "#{movie.director.count}"
end