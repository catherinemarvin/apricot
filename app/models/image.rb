class Image < ActiveRecord::Base
  attr_accessible :url

  attr_accessible :data

  before_create :default_values

  has_attached_file :data,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"
  acts_as_taggable

  private 
  
  def default_values
    self.unreviewed ||= true
  end

end
