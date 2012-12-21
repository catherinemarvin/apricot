Apricot.Views.Tags ||= {}

class Apricot.Views.Tags.TagCloudView extends Backbone.View
  template: JST["backbone/templates/tags/tag_cloud"]

  render: =>
    $(@el).html(@template(tag_cloud: @options.tags ))
    @
