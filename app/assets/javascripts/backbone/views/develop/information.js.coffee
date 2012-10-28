Apricot.Views.Develop ||= {}

class Apricot.Views.Develop.Information extends Backbone.View
  template: JST["backbone/templates/develop/information"]

  initialize: () ->

  render: =>
    $(@el).html(@template())
    return this
