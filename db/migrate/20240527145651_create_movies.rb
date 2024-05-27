class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.integer :release_year
      t.text :poster_url

      t.timestamps
    end
  end
end
