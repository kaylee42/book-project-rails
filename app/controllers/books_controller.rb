class BooksController < ApplicationController
  def index
    @books = Book.all.sort_by {|book| [book.name, book.author.name]}
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
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
    end
  end
end
