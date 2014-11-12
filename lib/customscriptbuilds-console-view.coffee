{View} = require 'atom'

module.exports =
class CustomScriptBuildsConsoleView extends View

  @content: ->
    @div class: 'panel-heading padded heading header-view', =>
      @span class: 'heading-title', outlet: 'title'
      @span class: 'heading-status', outlet: 'status'
      @span
        class: 'heading-close icon-remove-close pull-right'
        outlet: 'closeButton'
        click: 'close'

  initialize: (@runOptions) ->
    console.log "init console"
    #atom.workspaceView.command 'customscriptbuilds:open-console', => @toggleScriptOptions()
    #atom.workspaceView.command 'customscriptbuilds:close-console', =>
      #@toggleScriptOptions 'hide'
    #@toggleScriptOptions 'hide'
    #console.log this
    atom.workspaceView.command 'customscriptbuilds:open-console', => @toggleScriptOptions()
    atom.workspaceView.command 'customscriptbuilds:close-console', =>
      @toggleScriptOptions 'hide'
    #atom.workspaceView.command 'customscriptbuilds:save-console', => @saveOptions()
    atom.workspaceView.prependToTop this
    @toggleScriptOptions 'hide'

  toggleScriptOptions: (command) ->
    #console.log command
    #console.log this.hide()
    #@CustomScriptBuildsConfigView.hide()
    switch command
      when 'show' then this.show() #@CustomScriptBuildsConfigView.show()
      when 'hide' then this.hide() #@CustomScriptBuildsConfigView.hide()
      else this.toggle() #@CustomScriptBuildsConfigView.toggle()
    console.log "toggle console"

  close: ->
    atom.workspaceView.trigger 'customscriptbuilds:close-console'

  setStatus: (status) ->
    @status.removeClass 'icon-alert icon-check icon-hourglass icon-stop'
    switch status
      when 'start' then @status.addClass 'icon-hourglass'
      when 'stop' then @status.addClass 'icon-check'
      when 'kill' then @status.addClass 'icon-stop'
      when 'err' then @status.addClass 'icon-alert'
