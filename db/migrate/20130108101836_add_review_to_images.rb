class AddReviewToImages < ActiveRecord::Migration
  def change
    add_column :images, :unreviewed, :boolean
  end
end
