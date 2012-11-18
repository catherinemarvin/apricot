Apricot.Views.Tags ||= {}

class Apricot.Views.Tags.TagCloudView extends Backbone.View
  template: JST["backbone/templates/tags/tag_cloud"]

  initialize: () ->
    console.log "hi"
    # @options.images.bind('reset', @addAll)

  render: =>
    $(@el).html @template
    return this
