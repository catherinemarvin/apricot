class AddTagsStringToImages < ActiveRecord::Migration
  def change
    add_column :images, :tags_string, :string
  end
end
