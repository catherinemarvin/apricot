class Apricot.Routers.ImagesRouter extends Backbone.Router
  initialize: (options) ->
    @images = new Apricot.Collections.ImagesCollection()
    @images.reset options.images
    @toolbar = new Apricot.Views.Toolbars.Toolbar()
    $("#toolbar").html(@toolbar.render().el)
    @footer = new Apricot.Views.Toolbars.Footer()
    $("#footerWrapper").html(@footer.render().el)

    @tags = new Apricot.Collections.TagsCollection()
    @tags.reset options.tags



  routes:
    "submit" : "submitImage"
    "index" : "index"
    "random" : "random"
    "tags" :  "tags"
    "info" : "info"
    "admin" : "admin"
    ":id/edit" : "edit"
    ":id" : "show"
    "search/:params" : "search"
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
    $.getJSON "/images/random", (images) ->
      @images = new Apricot.Collections.ImagesCollection().reset(images)
      @view = new Apricot.Views.Images.RandomView images: @images
      $("#images").html(@view.render().el)

  tags: ->
    $.getJSON "/tags", (data) =>
      @tags = new Apricot.Collections.TagsCollection().reset(data)
      @view = new Apricot.Views.Tags.TagCloudView(tags: @tags)
      $("#images").html(@view.render().el)

  info: ->
    @view = new Apricot.Views.Develop.Information
    $("#images").html(@view.render().el)

  search: (params) ->
    # note that the images are passed in through the ajax call
    $.getJSON "/images/search", {tag: params}, (images) ->
      @images = new Apricot.Collections.ImagesCollection().reset(images)
      @view = new Apricot.Views.Images.SearchView(images: @images)
      $("#images").html(@view.render().el)

  admin: ->
    @view = new Apricot.Views.Images.AdminView
    $("#images").html @view.render().el
