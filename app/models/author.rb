class Author < ActiveRecord::Base
  has_many :books
  has_many :ratings, through: :books

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
