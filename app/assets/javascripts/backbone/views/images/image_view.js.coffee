Apricot.Views.Images ||= {}

class Apricot.Views.Images.ImageView extends Backbone.View
  template: JST["backbone/templates/images/image"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
