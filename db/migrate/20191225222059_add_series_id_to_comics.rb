class AddSeriesIdToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :series_id, :integer 
  end
end
