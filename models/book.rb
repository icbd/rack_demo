class Book < ActiveRecord::Base
  validates :isbn, :name, :price, presence: true
end
