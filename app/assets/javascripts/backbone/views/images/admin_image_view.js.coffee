Apricot.Views.Images ||= {}

class Apricot.Views.Images.AdminImageView extends Backbone.View
  template: JST["backbone/templates/images/admin_image"]

  className: "box"

  events:
    "click .destroy" : "destroy"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
