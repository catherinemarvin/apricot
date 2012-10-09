Apricot.Views.Images ||= {}

class Apricot.Views.Images.NewView extends Backbone.View
  template: JST["backbone/templates/images/new"]

  events:
    "submit #new-image": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (image) =>
        @model = image
        window.location.hash = "/#{@model.id}"

      error: (image, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
