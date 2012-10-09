Apricot.Views.Images ||= {}

class Apricot.Views.Images.ShowView extends Backbone.View
  template: JST["backbone/templates/images/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
