class User < ActiveRecord::Base
  has_many :ratings
  has_many :books, through: :ratings
  has_many :frienships
  has_many :friends, through: :frienships

  has_secure_password
  validates_presence_of :name, :username, :password_confirmation
  validates :username, uniqueness: {case_sensitive: false}
end
