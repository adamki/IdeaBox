class CreateIdeasImages < ActiveRecord::Migration
  def change
    create_table :ideas_images do |t|
      t.belongs_to :idea, index: :true
      t.belongs_to :image, index: :true
    end
  end
end
