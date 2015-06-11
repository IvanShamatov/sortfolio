class AddColumnToWebstudios < ActiveRecord::Migration
  def change
    add_column :webstudios, :img, :string
  end
end
