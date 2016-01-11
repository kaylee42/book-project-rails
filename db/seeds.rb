users = User.all.map {|a| a.id}
books = Book.all.map {|g| g.id}
amount = [1,2,3,4,5,3,4,5,6,7,8,9,7,8,10]

300.times {Rating.create(amount: amount.sample, user_id: users.sample, book_id: books.sample) }
