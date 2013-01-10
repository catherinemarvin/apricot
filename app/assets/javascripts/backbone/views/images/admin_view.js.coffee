Apricot.Views.Images ||= {}

class Apricot.Views.Images.AdminView extends Backbone.View
  template: JST["backbone/templates/images/admin"]

  render: =>
    $(@el).html @template()
    return this
