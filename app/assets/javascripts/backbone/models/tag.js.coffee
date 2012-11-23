class Apricot.Models.Tag extends Backbone.Model
  paramRoot: 'tag'

  defaults:
    url: null

class Apricot.Collections.TagsCollection extends Backbone.Collection
  model: Apricot.Models.Tag
  url: '/tags'
