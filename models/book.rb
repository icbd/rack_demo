# frozen_string_literal: true

class Book < ActiveRecord::Base
  validates :isbn, :name, :price, presence: true
end
