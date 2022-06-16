json.extract! book, :id, :name, :genre_id, :created_at, :updated_at
json.url book_url(book, format: :json)
