class AddTheatreToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :theatre, :string
  end
end
