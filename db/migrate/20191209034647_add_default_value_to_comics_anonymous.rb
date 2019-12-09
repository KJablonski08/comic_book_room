class AddDefaultValueToComicsAnonymous < ActiveRecord::Migration[6.0]
  def change
    change_column :comics, :anonymous, :boolean, default: false
  end
end
