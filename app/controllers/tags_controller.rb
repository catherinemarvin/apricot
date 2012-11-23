class TagsController < ApplicationController
  # get list of all tags
  def index
    @tags = Image.tag_counts_on(:tags)
    render :json => @tags.to_json
  end
end