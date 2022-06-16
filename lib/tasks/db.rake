namespace :db do
    namespace :seed do
        desc "Clear the database and load data into database and meilisearch"
        task :application_database => :environment do
            puts 'Clearing tables...'
            #clear_database
            puts 'Tables cleared!'
            puts 'Creating new records on database and meilisearch'
            puts 'Records were created succesfully!'
        end
    end    
end

def clear_database
    BookAuthor.destroy_all
    Book.destroy_all
    Genre.destroy_all
    Author.destroy_all
end

def crete_genres!
    genres = (1..10).map { { name: Faker::Book.genre } }
    Genre.create!(genres)
end

def create_authors!
    authors = (1..9).map { { name: Faker::Book.author } }
    Author.create!(authors)
end

def create_book_authors!
    lista_authores = Author.limit(10).to_a
    lista_books = Book.limit(10).to_a
    lista_books.each do |livro|    
        autores = lista_authores.sample(rand(1..9))
        autores.each do |autor|
            BookAuthor.create!({ book: livro, author: autor })
        end    
    end
end

def create_books!
    Book.create!(
        (1..10).map do
            {
                title: Faker::Book.title,            
                genre_id: genre_ids.sample,
                poster: Faker::LoremFlickr.image
            }     
        end
    )    
end