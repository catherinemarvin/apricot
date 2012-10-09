Apricot.Views.Images ||= {}

class Apricot.Views.Images.IndexView extends Backbone.View
  template: JST["backbone/templates/images/index"]

  initialize: () ->
    @options.images.bind('reset', @addAll)

  addAll: () =>
    @options.images.each(@addOne)

  addOne: (image) =>
    view = new Apricot.Views.Images.ImageView({model : image})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(images: @options.images.toJSON() ))
    @addAll()

    return this
