class CreateActorGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :actor_genres do |t|
      t.references :actor, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
