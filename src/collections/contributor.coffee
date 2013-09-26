class @ContributorCollection extends Backbone.Collection
  initialize: (options) ->
    @repo = options.repo
    #alert @repo

  model: Contributor
  url: -> ['https://api.github.com/repos', @repo, "collaborators"].join("/")
  

