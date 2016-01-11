class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  delegate :author, to: :book

  validates_presence_of :amount, :user_id, :book_id
  validates_uniqueness_of :user_id, scope: :book_id
end
