###
 Project Name: Custom Script Builds
 Link: https://github.com/Lightnet/customscriptbuilds
 License: MIT
 Information: To run typescript for server hosting for better style format flow.
 To create a simple work flow layout. For browser game or application for html.

###

{View} = require 'atom'
#path = require 'path'
#temp = require 'temp'
CustomScriptBuildsServerView = require './customscriptbuilds-server-view'

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
    atom.commands.add 'atom-workspace', 'customscriptbuilds:dialog': => @script_dialog()

    @dialog_process("intbtn")

    atom.workspaceView.command "customscriptbuild:dialogbox", =>
      # do setup stuff (build the params object)
      atom.confirm
        message: "[dialog]You sure?"
        buttons:
          Cancel: =>  #Do nothing
            @dialog_process("gone")
          OK: => # run the delete handler
            @dialog_process("intbtn")


        #console.log "tesy"
      #if answer == 1
        #console.log answer
        #@mm.run(params).then (result) =>
          #@mmResponseHandler(params, result)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  dialog_process: (intbtn) ->
    console.log "dialog"
    console.log intbtn

  btn_cancel:->
    console.log "cancel"

  btn_ok:->
    console.log "ok"

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

  script_dialog: ->
    #spyOn(atom, 'confirm').andReturn(1)
    atom.workspaceView.trigger 'customscriptbuild:dialogbox'
    #expect(mm.run).toHaveBeenCalled()

  window_about: ->
    BrowserWindow = require('remote').require 'browser-window'
    mainWindow = new BrowserWindow({width: 800, height: 600, frame: true });
    mainWindow.loadUrl('https://github.com/Lightnet/customscriptbuilds')
    mainWindow.show()

  script_currentview: ->
    console.log 'script_currentview'

    console.log atom.workspace

    editor = atom.workspace.getActiveTextEditor()
    console.log editor.getUri()
    console.log editor.getTitle()
    # place a view to the left of the panes
    #atom.workspaceView.appendToLeft(new CustomScriptBuildsServerView)
    #read doc link https://atom.io/docs/v0.146.0/advanced/view-system
    atom.workspaceView.appendToBottom(new CustomScriptBuildsServerView)









    #editorElement = atom.workspaceView.find("atom-text-editor.active")
    #console.log editorElement
    # get the view object by calling `.view()` to call view-specific methods
    #editorView = editorElement.view()
    #editorView.setCursorBufferPosition([1, 2])
    #console.log editorView
    #console.log atom.workspaceView



    #console.log editor.getTitle() #get current title tab
    #console.log editor
    #console.log editor.getUri() #get file path

    #BrowserWindow = require('remote').require 'browser-window'
    #mainWindow = new BrowserWindow({width: 800, height: 600, frame: true });
    #mainWindow.loadUrl editor.getUri()
    #mainWindow.loadUrl('http://localhost:57772/csp/sys/webterminal/index.csp')
    #mainWindow.show()

    #console.log atom.workspace(editor.getUri(),{}) #not working
    #console.log atom.workspace(editor.getTitle(),{}) #not working
    #console.log atom.workspace

    #console.log atom.workspace.open editor.getTitle()
    #console.log atom.workspace.open 'sample.js'

    #console.log atom.workspace.openSync 'sample.js'
    #console.log atom.workspace.openSync 'sample.js'
    #console.log atom.workspace.openUriInPane 'sample.js' #not work
    #console.log atom
    #console.log atom.getConfigDirPath()
    #console.log atom.getCurrentWindow()

    #https://discuss.atom.io/t/atom-project-path-cannot-call-path-of-undefined-in-test/12041
    #console.log atom.workspaceView
    #directory = temp.mkdirSync()
    #console.log directory
    #atom.project.setPath(directory)
    #console.log directory
    #atom.workspaceView = new WorkspaceView()
    #atom.workspace = atom.workspaceView.model
    #console.log atom

    #console.log atom.workspace.open('sample.js',['newWindow':"true"])
    #
    #editor = atom.workspace.getActivePaneItem()
    #editor.insertText('Hello, World!')

    #
