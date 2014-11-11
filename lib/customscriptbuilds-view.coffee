module.exports =
class CustomscriptbuildsView
  constructor: (serializeState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('customscriptbuilds',  'overlay', 'from-top')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The Customscriptbuilds package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

    # Register command that toggles this view
    atom.commands.add 'atom-workspace', 'customscriptbuilds:toggle': => @toggle()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:compile': => @script_compile()
    atom.commands.add 'atom-workspace', 'customscriptbuilds:run': => @script_run()

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


  script_compile: ->
    console.log 'script_compile'

  script_run: ->
    console.log 'script_run'
