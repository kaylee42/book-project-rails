class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates_presence_of :amount, :user_id, :book_id
end
