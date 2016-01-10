class AuthorsController < ApplicationController
  def index
    @authors = Author.all.sort_by {|author| author.name}
  end

  def show
    @author = Author.find(params[:id])
  end

  def search
    search_term = params[:keyword]
    authors = Author.where("lower(name) = ?", search_term.downcase)
    if authors.length == 1
      redirect_to authors.first
    else
      @authors = Search.for(s_type: Author, name: search_term).sort_by {|author| author.name}
      if @authors == []
        redirect_to authors_path, notice: "Sorry, couldn't find what you were looking for! Please try again."
      end
    end
  end
end
