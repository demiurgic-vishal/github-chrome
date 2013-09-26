class @New2IssueView extends Backbone.View

  className: 'new-issue'

  events:
    "submit form" : "onSubmit"

  initialize: (@options) ->
    @repository = @options.repository
    @body = window.body
    @title = window.title
    #alert @title
    @repository1 =window.repository
    #alert JSON.stringify(@repository1)
    
  render: ->
    @$el.html(HAML['new2_issue'](repository: @repository, milestones: window.milestonec))
    @$('select').select2()

  onSubmit: (e) ->
    e.preventDefault()
    #alert @body
    #alert @title
    assignee = @$("[name=assignee]").val()
    model = new IssueModel({
    body: @body
    title: @title
    assignee:assignee
    }, {repository: @repository1})
    model.save {},
      success: (model) =>
        @badge = new Badge()
        @badge.addIssues(1)
        @$('.message').html("<span>Issue <a href=\"#{model.get("html_url")}\" target=\"_blank\">##{model.get('number')}</a> was created!</span>")
      error: =>
        @$('.message').html("<span>Failed to create issue :(</span>")
    
    

