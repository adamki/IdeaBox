class AddUrlAndNameToImages < ActiveRecord::Migration
  def change
    add_column :images, :name, :string
    add_column :images, :url, :string
  end
end
