class User < ActiveRecord::Base
  has_many :ratings
  has_many :books, through: :ratings
  has_many :friendships
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_secure_password
  validates_presence_of :name, :username
  validates :username, uniqueness: {case_sensitive: false}

  def mutual_friends
    friends + inverse_friends
  end

end
