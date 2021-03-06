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
BrowserWindow = require('remote').require 'browser-window'

module.exports =
class CustomScriptBuildsToolbarView extends View
  browserWindow: null

  @content: ->
    #@div class: 'overlay from-top panel', outlet: 'scriptOptionsView', => #non header
    #@div class: 'panel-heading padded heading header-view', => #header
    #@div class: 'panel-heading padded heading header-view', => #header
    @div class: 'tool-panel padded heading header-view', => #header
      @span class: 'heading-status icon-terminal', outlet: 'icon_terimal', click: 'toggleconsole'

      @span class: 'heading-title', outlet: 'title'
      @span class: 'heading-status', outlet: 'status'
      #css = 'btn inline-block-tight'
      css = ''
      #css = 'btn'

      @span class: 'heading-title', outlet: 'title2'
      @a class: "#{css}", click: 'trigger_compilenodejs', '[ Nodejs ]'
      @a class: " #{css}", click: 'trigger_compilehtml', '[ html ]'

      @a class: "#{css}", click: 'trigger_compilefile', '[ File ]' # current file
      @a class: "#{css}", click: 'trigger_runfile', '[ Run File ]' # run file
      @a class: "#{css}", click: 'trigger_stopfile', '[ Stop File ]' # run file
      @span
      @label ' Server: '
      @a class: "#{css}", click: '', '[ Start ]'
      @a class: "#{css}", click: '', '[ Stop ]'
      @a class: "#{css}", click: '', '[ Restart ]'

      @label ' Browser: '
      @a class: "#{css}", click: 'openbrowser', '[ Open ]'
      @a class: "#{css}", click: 'refreshbrowser', '[ Refresh ]'

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
        click: 'toggleScriptOptions'

  initialize: (@runOptions) ->
    @title.text  'Status:'
    @title2.text 'Compile:'
    #setup icon css
    #@setStatus  'start'
    @setStatus ''

    #@icon_buildscript.addClass 'icon-package'
    #@icon_compilescript.addClass 'icon-pencil'
    #@icon_runscript.addClass 'icon-playback-play'
    #@icon_stopscript.addClass 'icon-primitive-square'
    #@icon_restartscript.addClass 'icon-sync'

    #@web.addClass 'icon-browser'
    #@icon_startserver.addClass 'icon-playback-play'
    #@icon_stopserver.addClass 'icon-primitive-square'
    #@icon_restartserver.addClass 'icon-sync'

    atom.workspaceView.command 'customscriptbuilds:open-toolbar', => @toggleScriptOptions()
    atom.workspaceView.command 'customscriptbuilds:close-toolbar', =>
      @toggleScriptOptions 'hide'
    bshow = atom.config.get "customscriptbuilds.showtoolbar"
    console.log bshow
    if bshow == true
      @toggleScriptOptions 'show'
    else
      @toggleScriptOptions 'hide'

  toggleScriptOptions: (command) ->
    switch command
      when 'show' then this.show()
      when 'hide' then this.hide()
      else this.toggle()
    #console.log this
    #console.log this.isVisible()
    if 'show' == command
      atom.config.set("customscriptbuilds.showtoolbar", true)
    else if 'hide' == command
      atom.config.set("customscriptbuilds.showtoolbar", false)
    else
      atom.config.set("customscriptbuilds.showtoolbar", this.isVisible())

  close: ->
    atom.workspaceView.trigger 'customscriptbuilds:close-server'
  toggleconsole: ->
    atom.workspaceView.trigger 'customscriptbuilds:toggle-console'

  trigger_compilenodejs:->
    atom.workspaceView.trigger 'customscriptbuilds:compile-nodejs'
  trigger_compilehtml:->
    atom.workspaceView.trigger 'customscriptbuilds:compile-html'

  trigger_compilefile:->
    #atom.workspaceView.trigger 'customscriptbuilds:compile-html'
  trigger_runfile:->
    #atom.workspaceView.trigger 'customscriptbuilds:compile-html'


  setStatus: (status) ->
    @status.removeClass 'icon-alert icon-check icon-hourglass icon-stop icon-dash'

    #@status.addClass 'icon-browser'
    #@status.addClass 'icon-playback-play'
    #@status.addClass 'icon-playback-pause'
    #@status.addClass 'icon-primitive-square'

    switch status
      when 'start' then @status.addClass 'icon-hourglass'
      when 'stop' then @status.addClass 'icon-check'
      when 'kill' then @status.addClass 'icon-stop'
      when 'err' then @status.addClass 'icon-alert'
      else @status.addClass 'icon-dash'

  openbrowser: ->
    console.log @browserWindow
    if @browserWindow == null
      @browserWindow = new BrowserWindow({width: 800, height: 600, frame: true });
      @browserWindow.loadUrl('https://www.google.ca')
      #mainWindow.loadUrl('http://localhost:57772/csp/sys/webterminal/index.csp')
      @browserWindow.show()
      console.log "show browserWindow"
    else
      try
        @browserWindow.loadUrl('https://www.google.ca')
        @browserWindow.show()
      catch error
        @browserWindow = new BrowserWindow({width: 800, height: 600, frame: true });
        @browserWindow.loadUrl('customscriptbuilds://my-settings')
        @browserWindow.show()
      console.log "other show browserWindow"

      #
  refreshbrowser: ->
    if @browserWindow != null
      console.log @browserWindow
      try
        @browserWindow.reload()
      catch error
        @browserWindow = new BrowserWindow({width: 800, height: 600, frame: true });
        @browserWindow.loadUrl('customscriptbuilds://my-settings')
        @browserWindow.show()
  #
