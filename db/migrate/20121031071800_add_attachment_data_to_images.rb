class AddAttachmentDataToImages < ActiveRecord::Migration
  def self.up
    add_attachment :images, :data 
  end

  def self.down
    remove_attachment :images, :data
  end
end
