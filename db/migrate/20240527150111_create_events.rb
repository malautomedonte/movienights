class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.datetime :date
      t.string :location

      t.timestamps
    end
  end
end
