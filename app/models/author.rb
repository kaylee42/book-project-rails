class Author < ActiveRecord::Base
  has_many :books
  has_many :rating, through: :books

  validates_presence_of :name
  validates_uniqueness_of :name
end
