class CreateUserDirectors < ActiveRecord::Migration[7.1]
  def change
    create_table :user_directors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
