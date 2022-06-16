class BookAuthor < ApplicationRecord
  belongs_to :book, touch: true
  belongs_to :author, touch: true
end
