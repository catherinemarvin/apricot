Apricot.Views.Images ||= {}

class Apricot.Views.Images.EditView extends Backbone.View
  template : JST["backbone/templates/images/edit"]

  events :
    "submit #edit-image" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (image) =>
        @model = image
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
