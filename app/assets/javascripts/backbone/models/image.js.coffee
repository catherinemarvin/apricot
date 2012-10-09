class Apricot.Models.Image extends Backbone.Model
  paramRoot: 'image'

  defaults:
    url: null

class Apricot.Collections.ImagesCollection extends Backbone.Collection
  model: Apricot.Models.Image
  url: '/images'
