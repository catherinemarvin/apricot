class Apricot.Routers.ImagesRouter extends Backbone.Router
  initialize: (options) ->
    @images = new Apricot.Collections.ImagesCollection()
    @images.reset options.images


  routes:
    "new"      : "newImage"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newImage: ->
    @view = new Apricot.Views.Images.NewView(collection: @images)
    $("#images").html(@view.render().el)

    @toolbar = new Apricot.Views.Toolbars.Toolbar(active: "new")
    $("#toolbar").html(@toolbar.render().el)

  index: ->
    @view = new Apricot.Views.Images.IndexView(images: @images)
    $("#images").html(@view.render().el)

    @toolbar = new Apricot.Views.Toolbars.Toolbar(active: "home")
    $("#toolbar").html(@toolbar.render().el)

  show: (id) ->
    image = @images.get(id)

    @view = new Apricot.Views.Images.ShowView(model: image)
    $("#images").html(@view.render().el)

  edit: (id) ->
    image = @images.get(id)

    @view = new Apricot.Views.Images.EditView(model: image)
    $("#images").html(@view.render().el)
