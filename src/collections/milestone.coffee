class @MilestoneCollection extends Backbone.Collection
  initialize: (options) ->
    @repo = options.repo
    #alert @repo

  model: Milestone
  url: -> ['https://api.github.com/repos', @repo, "milestones"].join("/")