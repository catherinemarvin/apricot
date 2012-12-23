Apricot.Views.Toolbars ||= {}

class Apricot.Views.Toolbars.Footer extends Backbone.View
  template: JST["backbone/templates/toolbars/footer"]

  id: "footer"

  initialize: () ->
    $(@el).html(@template)

  render: =>
    @
