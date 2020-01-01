class RemoveSeriesFromComics < ActiveRecord::Migration[6.0]
  def change
    remove_column :comics, :series_title, :string
  end
end
