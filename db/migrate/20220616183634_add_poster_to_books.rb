class AddPosterToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :poster, :string
  end
end
