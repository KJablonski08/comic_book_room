class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :series_title
      t.integer :issue_number
      t.integer :quantity_owned
      t.string :condition
      t.boolean :anonymous
      t.timestamps
    end
  end
end
