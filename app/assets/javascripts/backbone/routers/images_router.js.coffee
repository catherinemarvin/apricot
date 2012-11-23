class Apricot.Routers.ImagesRouter extends Backbone.Router
  initialize: (options) ->
    @images = new Apricot.Collections.ImagesCollection()
    @images.reset options.images
    @toolbar = new Apricot.Views.Toolbars.Toolbar()
    $("#toolbar").html(@toolbar.render().el)

    @tags = new Apricot.Collections.TagsCollection()
    @tags.reset options.tags



  routes:
    "submit" : "submitImage"
    "index" : "index"
    "random" : "random"
    "tags" :  "tags"
    "info" : "info"
    ":id/edit" : "edit"
    ":id" : "show"
    ".*" : "index"

  submitImage: ->
    @view = new Apricot.Views.Images.SubmitView(collection: @images)
    $("#images").html(@view.render().el)

  index: ->
    @view = new Apricot.Views.Images.IndexView(images: @images)
    $("#images").html(@view.render().el)

  show: (id) ->
    image = @images.get(id)
    @view = new Apricot.Views.Images.ShowView(model: image)
    $("#images").html(@view.render().el)

  edit: (id) ->
    image = @images.get(id)
    @view = new Apricot.Views.Images.EditView(model: image)
    $("#images").html(@view.render().el)

  random: ->
    $("#images").html("Random is THE FUTURE")

  tags: ->
    @view = new Apricot.Views.Tags.TagCloudView(tags: @tags)
    $("#images").html(@view.render().el)

  info: ->
    @view = new Apricot.Views.Develop.Information
    $("#images").html(@view.render().el)
