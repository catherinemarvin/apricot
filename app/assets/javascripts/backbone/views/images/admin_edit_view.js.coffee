Apricot.Views.Images ||= {}

class Apricot.Views.Images.AdminEditView extends Backbone.View
  template : JST["backbone/templates/images/edit"]

  events :
    "ajax:success" : "redirectToImage"

  redirectToImage : (xhr, data, status) ->
    @model.set JSON.parse data
    window.location.hash = "/#{@model.id}"

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
