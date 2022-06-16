class Book < ApplicationRecord
  belongs_to :genre
  has_many :book_authors
  has_many :authors, through: :book_authors
  include MeiliSearch::Rails
    after_touch :index!
    meilisearch do
        searchable_attributes [:title, :authors, :genre]
        filterable_attributes [:genre, :authors]
        sortable_attributes [:created_at, :updated_at]
        attribute :title, :poster
        attribute :authors do
            authors.pluck(:name)
        end
    end
end
