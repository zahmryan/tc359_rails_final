class CreateMoviestores < ActiveRecord::Migration
  def change
    create_table :moviestores do |t|
      t.text :title
      t.text :genre
      t.integer :stock
      t.date :release_date
      t.boolean :currently_rented_out

      t.timestamps
    end
  end
end
