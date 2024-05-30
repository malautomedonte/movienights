class CreateDirectorGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :director_genres do |t|
      t.references :director, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
