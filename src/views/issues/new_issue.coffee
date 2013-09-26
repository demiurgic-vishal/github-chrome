class @NewIssueView extends Backbone.View

  className: 'new-issue'

  events:
    "submit form" : "onSubmit"

  initialize: (@options) ->
    @repositories = @options.repositories
  render: ->
    @$el.html(HAML['new_issue'](repositories: @repositories ))
    @$('select').select2()

  onSubmit: (e) ->
    e.preventDefault()
    name = @$("[name=repository]").val()
    localStorage['new_issue_last_repo'] = name
    repository = @repositories.find (r) -> r.get('full_name') == name
    window.assigneec = new ContributorCollection({'repo':name})
    window.milestonec = new MilestoneCollection({'repo':name})
    window.th=@$el
    #window.temp=0
    window.body = @$("[name=body]").val()
    window.title = @$("[name=title]").val()
    window.repository=repository
    window.temp1=0
    window.temp2=0
    window.assigneec.fetch
      success: ->
        window.temp1=1
    window.milestonec.fetch
      success: ->
        window.temp2=1
    func = () ->
      if(window.temp1==1&&window.temp2==1)  
        #alert JSON.stringify(window.assigneec)
        @newIssueView2 = new New2IssueView(repository: window.assigneec)
        window.th.html @newIssueView2.el
        @newIssueView2.render()
        window.temp1=0
    setInterval func,500
    #while window.temp==1
     # model = new IssueModel({
     # body: @$("[name=body]").val()
     # title: @$("[name=title]").val()
     # assignee:window.assignee
     # }, {repository: repository})
     # alert window.assignee
     # window.temp=0
     # model.save {},
      #  success: (model) =>
       #   @badge = new Badge()
        #  @badge.addIssues(1)
         # @$('.message').html("<span>Issue <a href=\"#{model.get("html_url")}\" target=\"_blank\">##{model.get('number')}</a> was created!</span>")
        #error: =>
         # @$('.message').html("<span>Failed to create issue :(</span>")

