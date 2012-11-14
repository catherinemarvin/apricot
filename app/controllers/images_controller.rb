class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
    @images.each do |image|
      image.tags_string = image.tag_list.join " "
      image.save
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @images }
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

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { head :no_content }
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
