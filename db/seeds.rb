10.times {Genre.create(name: Faker::Book.genre)}

20.times {Author.create(name: Faker::Book.author)}

authors = Author.all.map {|a| a.id}
genres = Genre.all.map {|g| g.id}

100.times {Book.create(name: Faker::Book.title, author_id: authors.sample, genre_id: genres.sample)}
