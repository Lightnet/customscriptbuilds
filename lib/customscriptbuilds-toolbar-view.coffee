###
 Project Name: Custom Script Builds
 Link: https://github.com/Lightnet/customscriptbuilds
 License: MIT
 Information: To run typescript for server hosting for better style format flow.
 To create a simple work flow layout. For browser game or application for html.

###

{View} = require 'atom'

module.exports =
class CustomScriptBuildsToolbarView extends View

  @content: ->
    #@div class: 'overlay from-top panel', outlet: 'scriptOptionsView', => #non header
    @div class: 'panel-heading padded heading header-view', => #header
      @span class: 'heading-title', outlet: 'title'
      @span class: 'heading-status', outlet: 'status'
      @span
        class: 'heading-close icon-remove-close pull-right'
        outlet: 'closeButton'
        click: 'close'

  initialize: (@runOptions) ->
    @title.text  'Toolbar'
    @setStatus  'start'
    atom.workspaceView.command 'customscriptbuilds:open-toolbar', => @toggleScriptOptions()
    atom.workspaceView.command 'customscriptbuilds:close-toolbar', =>
      @toggleScriptOptions 'hide'

  toggleScriptOptions: (command) ->
    switch command
      when 'show' then this.show()
      when 'hide' then this.hide()
      else this.toggle()

  close: ->
    atom.workspaceView.trigger 'customscriptbuilds:close-server'

  setStatus: (status) ->
    @status.removeClass 'icon-alert icon-check icon-hourglass icon-stop'
    switch status
      when 'start' then @status.addClass 'icon-hourglass'
      when 'stop' then @status.addClass 'icon-check'
      when 'kill' then @status.addClass 'icon-stop'
      when 'err' then @status.addClass 'icon-alert'
