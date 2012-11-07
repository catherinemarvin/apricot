Apricot.Views.Images ||= {}

class Apricot.Views.Images.SubmitView extends Backbone.View
  template: JST["backbone/templates/images/submit"]

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

    console.log "hi"
    data = new FormData()

    # @model.unset("errors")

    # @collection.create(@model.toJSON(),
    #   success: (image) =>
    #     @model = image
    #     window.location.hash = "/#{@model.id}"

    #   error: (image, jqXHR) =>
    #     @model.set({errors: $.parseJSON(jqXHR.responseText)})
    # )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
