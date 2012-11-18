class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Image.all

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
        # format.html { redirect_to @image, notice: 'Image was successfully created.' }
        # format.json { render json: @image, status: :created, location: @image }
        format.html { render json: @image, status: :created, location: @image }
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
        # format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        # format.json { head :no_content }
        format.html { render json: @image }
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
end
