class Book < ActiveRecord::Base
  belongs_to :author
  belongs_to :genre
  has_many :ratings
  has_many :users, through: :ratings

  validates_presence_of :name, :author_id
  validates_uniqueness_of :name, scope: :author_id
  def average_rating
    self.ratings.average(:amount).to_f.round(2)
  end
end
