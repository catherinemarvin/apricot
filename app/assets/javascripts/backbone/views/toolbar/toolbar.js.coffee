Apricot.Views.Toolbars ||= {}

class Apricot.Views.Toolbars.Toolbar extends Backbone.View
  template: JST["backbone/templates/toolbars/toolbar"]

  initialize: () ->

  render: =>
    $(@el).html(@template(active: @options.active))
    return this
