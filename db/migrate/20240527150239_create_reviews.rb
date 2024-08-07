class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.float :rating

      t.timestamps
    end
  end
end
