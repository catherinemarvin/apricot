Apricot.Views.Images ||= {}

class Apricot.Views.Images.SubmitView extends Backbone.View
  template: JST["backbone/templates/images/submit"]

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind "change:errors", =>
      this.render()

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    @$("form").backboneLink(@model)

    @
