class Search

  def self.for(s_type: s_type, name: name)
    s_type.where("name like ?", "%#{name}%")
  end

end
