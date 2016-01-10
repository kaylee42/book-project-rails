class Search

  def self.for(s_type: s_type, name: name)
    s_type.where("name like ?", "%#{name}%")
  end

  def self.users(name)
    results = User.where("username like ?", "%#{name}%")
    results << User.where("name like ?", "%#{name}%")
    results.flatten.uniq
  end
end
