###
 Project Name: Custom Script Builds
 Link: https://github.com/Lightnet/customscriptbuilds
 License: MIT
 Information: To run typescript for server hosting for better style format flow.
 To create a simple work flow layout. For browser game or application for html.
###

###
Base Icons Link:https://octicons.github.com/
###

{View} = require 'atom'

module.exports =
class CustomScriptBuildsToolbarView extends View

  @content: ->
    #@div class: 'overlay from-top panel', outlet: 'scriptOptionsView', => #non header
    @div class: 'panel-heading padded heading header-view', => #header

      @span class: 'heading-status icon-terminal', outlet: 'icon_terimal'

      @span class: 'heading-title', outlet: 'title2'
      @span class: 'heading-status', outlet: 'icon_buildscript'
      @span class: 'heading-status', outlet: 'icon_compilescript'
      @span class: 'heading-status', outlet: 'icon_runscript'
      @span class: 'heading-status', outlet: 'icon_stopscript'
      @span class: 'heading-status', outlet: 'icon_restartscript'

      @span class: 'heading-title', outlet: 'title'
      @span class: 'heading-status', outlet: 'status'
      @span class: 'heading-status', outlet: 'icon_startserver'
      @span class: 'heading-status', outlet: 'icon_stopserver'
      @span class: 'heading-status', outlet: 'icon_restartserver'
      @span
      @span
        class: 'heading-status'
        outlet: 'web'
        click: 'openbrowser'
      @span
        class: 'heading-close icon-remove-close pull-right'
        outlet: 'closeButton'
        click: 'close'
      @span
        class: 'heading-close icon-dash pull-right'
        outlet: 'closeButton'
        click: 'close'

  initialize: (@runOptions) ->
    @title.text  'Server Status:'
    @title2.text 'Build Modes:'
    #setup icon css
    #@setStatus  'start'
    @setStatus ''

    @icon_buildscript.addClass 'icon-package'
    @icon_compilescript.addClass 'icon-pencil'
    @icon_runscript.addClass 'icon-playback-play'
    @icon_stopscript.addClass 'icon-primitive-square'
    @icon_restartscript.addClass 'icon-sync'


    @web.addClass 'icon-browser'
    @icon_startserver.addClass 'icon-playback-play'
    @icon_stopserver.addClass 'icon-primitive-square'
    @icon_restartserver.addClass 'icon-sync'

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

    #@status.addClass 'icon-browser'
    #@status.addClass 'icon-playback-play'
    #@status.addClass 'icon-playback-pause'
    #@status.addClass 'icon-primitive-square'

    switch status
      when 'start' then @status.addClass 'icon-hourglass'
      when 'stop' then @status.addClass 'icon-check'
      when 'kill' then @status.addClass 'icon-stop'
      when 'err' then @status.addClass 'icon-alert'
      else @status.addClass 'icon-question'

  openbrowser: ->
    BrowserWindow = require('remote').require 'browser-window'
    mainWindow = new BrowserWindow({width: 800, height: 600, frame: true });
    #mainWindow.loadUrl editor.getUri()
    #mainWindow.loadUrl('http://localhost:57772/csp/sys/webterminal/index.csp')
    mainWindow.show()

    #
