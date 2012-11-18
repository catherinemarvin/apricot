Apricot.Views.Images ||= {}

class Apricot.Views.Images.EditView extends Backbone.View
  template : JST["backbone/templates/images/edit"]

  events :
    "submit #edit-image" : "update"
    "ajax:success" : "redirectToImage"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (image) =>
        @model = image
        window.location.hash = "/#{@model.id}"
    )

  redirectToImage : (xhr, data, status) ->
    @model.set JSON.parse data
    window.location.hash = "/#{@model.id}"

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
