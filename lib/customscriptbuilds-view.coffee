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


  script_build: ->
    console.log 'script_build'

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

  script_newtab: ->
    console.log 'script_newtab'

  script_newwindow: ->
    console.log 'script_newwindow'
