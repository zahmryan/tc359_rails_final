class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals, :id => false do |t|
      t.integer :movie_id
      t.integer :user_id
    end

    add_index :rentals, [:movie_id, :user_id]
  end

  def self.down
    drop_table :rentals
  end
end
