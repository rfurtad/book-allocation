# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
BookAuthor.destroy_all
Book.destroy_all
Genre.destroy_all
Author.destroy_all
genres = (1..10).map { { name: Faker::Book.genre } }
Genre.create!(genres)
genre_ids = Genre.all.pluck(:id)
authors = (1..9).map { { name: Faker::Book.author } }
Author.create!(authors)
books = (1..10).map do
        {
            title: Faker::Book.title,            
            genre_id: genre_ids.sample,
            poster: Faker::LoremFlickr.image
        }     
    end
Book.create!(books)
lista_authores = Author.limit(10).to_a
lista_books = Book.limit(10).to_a
lista_books.each do |livro|    
    autores = lista_authores.sample(rand(1..4))
    autores.each do |autor|
        BookAuthor.create!({ book: livro, author: autor })
    end    
end