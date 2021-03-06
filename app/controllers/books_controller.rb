class BooksController < ApplicationController
  def index
    @books = Book.all.sort_by {|book| [book.name, book.author.name]}
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    author = Author.find_or_create_by(name: params[:book][:authors][:name])
    genre = Genre.find_or_create_by(name: params[:book][:genres][:name])
    @book = Book.new(name: params[:book][:name], genre_id: genre.id, author_id: author.id)
    if @book.save
      redirect_to @book, notice: "Book successfully created!"
    else
      render :new
    end
  end

  def search
    search_term = params[:keyword]
    books = Book.where("lower(name) = ?", search_term.downcase)
    if books.length == 1
      redirect_to books.first
    elsif books.length != 0
      @books = books.sort_by {|book| book.author.name}
    else
      @books = Search.for(s_type: Book, name: search_term).sort_by {|book| [book.name, book.author.name]}
      if @books == []
        redirect_to books_path, notice: "Sorry, couldn't find what you were looking for! Please try again."
      end
    end
  end


end
