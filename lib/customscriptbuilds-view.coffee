module.exports =
class CustomscriptbuildsView
  constructor: (serializeState) ->

    # Create root element
    @element = document.createElement('div')
    @element.classList.add('customscriptbuilds',  'overlay', 'from-top')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The Customscriptbuilds package is good!"
    #message.textContent += "<button> TEST</button>"

    message.classList.add('message')
    @element.appendChild(message)

    message = document.createElement('button')
    message.textContent = "The button!"
    message.classList.add('message')
    @element.appendChild(message)



    # Register command that toggles this view
    atom.commands.add 'atom-workspace', 'customscriptbuilds:toggle': => @toggle()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:addmessage': => @script_addmessage()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:build': => @script_build()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:rebuild': => @script_rebuild()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:debug': => @script_debug()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:compile': => @script_compile()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:run': => @script_run()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:stop': => @script_stop()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:config': => @script_config()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:export': => @script_export()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:newtab': => @script_newtab()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:newwindow': => @script_newwindow()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:about': => @window_about()

    atom.commands.add 'atom-workspace', 'customscriptbuilds:set0': => @script_set0()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:set1': => @script_set1()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:log': => @script_log()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:currentview': => @script_currentview()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  # Toggle the visibility of this view
  toggle: ->
    console.log 'CustomscriptbuildsView was toggled!'

    if @element.parentElement?
      @element.remove()
    else
      atom.workspaceView.append(@element)

  script_addmessage: ->
    console.log 'script_compile'
    if @element.parentElement?

      # Create message element
      message = document.createElement('div')
      message.textContent = "Message added!"

      message.classList.add('message')
      #Add Text Message
      @element.appendChild(message)
  script_newtab: ->
    console.log 'script_newtab'

    BrowserWindow = require('remote').require 'browser-window'
    mainWindow = new BrowserWindow({width: 800, height: 600, frame: true });
    #mainWindow.loadUrl('http://localhost:57772/csp/sys/webterminal/index.csp')

    mainWindow.show()

  script_newwindow: ->
    console.log 'script_newwindow'

    BrowserWindow = require('remote').require 'browser-window'
    mainWindow = new BrowserWindow({width: 800, height: 600, frame: true });
    #mainWindow.loadUrl('http://localhost:57772/csp/sys/webterminal/index.csp')
    mainWindow.show()

  script_build: ->
    console.log 'script_build'
    # this is a plain jQuery object; you can't call view-specific methods
    editorElement = atom.workspaceView.find("atom-text-editor.active")
    console.log editorElement


    # get the view object by calling `.view()` to call view-specific methods
    editorView = editorElement.view()
    #editorView.setCursorBufferPosition([1, 2])
    console.log editorView

  script_rebuild: ->
    console.log 'script_rebuild'

  script_debug: ->
    console.log 'script_debug'

  script_compile: ->
    console.log 'script_compile'

  script_run: ->
    console.log 'script_run'

  script_stop: ->
    console.log 'script_stop'

  script_config: ->
    console.log 'script_config'

  script_export: ->
    console.log 'script_export'

  script_set0: ->
    console.log 'script_set0'
    atom.config.set("customscriptbuild.showInvisibles", true)

  script_set1: ->
    console.log 'script_set1'
    atom.config.set("customscriptbuild.showInvisibles", false)

  script_log: ->
    console.log 'script_log'
    console.log atom.config.get "customscriptbuild.showInvisibles"

  window_about: ->
    BrowserWindow = require('remote').require 'browser-window'
    mainWindow = new BrowserWindow({width: 800, height: 600, frame: true });
    mainWindow.loadUrl('https://github.com/Lightnet/customscriptbuilds')
    mainWindow.show()

  script_currentview: ->
    console.log 'script_currentview'
    #editorElement = atom.workspaceView.find("atom-text-editor.active")
    #console.log editorElement
    # get the view object by calling `.view()` to call view-specific methods
    #editorView = editorElement.view()
    #editorView.setCursorBufferPosition([1, 2])
    #console.log editorView
    #console.log atom.workspaceView

    editor = atom.workspace.getActiveTextEditor()

    console.log editor.getTitle() #get current title tab
    console.log editor
    console.log editor.getUri() #get file path

    BrowserWindow = require('remote').require 'browser-window'
    mainWindow = new BrowserWindow({width: 800, height: 600, frame: true });
    #mainWindow.loadUrl editor.getUri()
    #mainWindow.loadUrl('http://localhost:57772/csp/sys/webterminal/index.csp')
    mainWindow.show()


    #console.log atom.workspaceView
