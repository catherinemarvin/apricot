class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
    @tags = Image.tag_counts_on(:tags)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render @images.to_json(:include => :tags) }
    end
  end

  # POST /images
  # POST /images.json
  def create
    (@image = Image.new(data: params[:data])).save

    respond_to do |format|
      if @image
        @image.url = @image.data.url
        @image.save
        format.html { redirect_to "/images##{@image.id}" }
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])
    @image.tag_list = params[:tag_list]


    respond_to do |format|
      if @image.save
        format.html { render json: @image.to_json(:include => :tags) }
        # format.html { redirect_to "/images##{@image.id}" }
      else
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { head :no_content }
    end
  end

  # GET /images/search/
  def search
    @images = Image.tagged_with(params[:tag])

    respond_to do |format|
      format.html { render json: @images.to_json }
      format.json { render json: @images.to_json }
    end
  end

  # GET /images/random/
  def random
    @images = Image.find :all, :order => "RANDOM()"
    respond_to do |format|
      format.json { render json: @images.to_json }
    end
  end
end
