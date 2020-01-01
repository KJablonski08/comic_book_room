class CreatePublisherSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :publisher_series do |t|
      t.integer :publisher_id 
      t.integer :series_id
    end
  end
end
