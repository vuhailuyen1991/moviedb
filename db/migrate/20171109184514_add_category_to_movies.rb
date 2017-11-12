class AddCategoryToMovies < ActiveRecord::Migration[5.1]
  def change
    add_reference :movies, :category, foreign_key: true
  end
end
