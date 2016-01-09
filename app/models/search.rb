class Search

  def self.for(name)
    Book.where("name like ?", "%#{name}%")
  end

end
