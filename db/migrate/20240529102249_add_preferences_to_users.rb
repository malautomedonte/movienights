class AddPreferencesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :favorite_genres, :string
    add_column :users, :favorite_directors, :string
    add_column :users, :favorite_actors, :string
  end
end
