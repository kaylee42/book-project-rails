class User < ActiveRecord::Base
  has_many :ratings
  has_many :books, through: :ratings
  has_many :frienships
  has_many :friends, through: :frienships

  has_many :inverse_friendship, class_name: "Frienship", foreign_key: "friend_id"
  has_many :followers, through: :inverse_friendship, source: :user

  has_secure_password
  validates_presence_of :name, :username
  validates :username, uniqueness: {case_sensitive: false}

  def mutual_friends
    friends + followers
  end
end
