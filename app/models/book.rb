class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :genre
  has_many :ratings
  has_many :users, through: :ratings

  accepts_nested_attributes_for :author, :genre
  validates_presence_of :name, :author_id, :genre_id
  validates :name, uniqueness: {scope: :author_id, case_sensitive: false}
  def average_rating
    self.ratings.average(:amount).to_f.round(2)
  end
end
