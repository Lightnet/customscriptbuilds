CustomscriptbuildsView = require './customscriptbuilds-view'
CustomScriptBuildsConfigView = require './customscriptbuilds-config-view'
CustomScriptBuildsConsoleView = require './customscriptbuilds-console-view'

module.exports =
  #configDefaults:
  configDefaults:
    autoCompileSave: false
    compileType: {'ts','js','coffee'}

  ###
  config:
    someSetting:
      type: 'object'
      properties:
        myChildIntOption:
          type: 'integer'
          minimum: 1.5
          maximum: 11.5
  ###
  customscriptbuildsView: null
  customscriptbuildsconfigView: null
  customscriptbuildsconsoleView: null

  activate: (state) ->
    #console.log state
    @customscriptbuildsView = new CustomscriptbuildsView(state.customscriptbuildsViewState)
    @customscriptbuildsconfigView = new CustomScriptBuildsConfigView(state.customscriptbuildsconfigViewState)
    #console display logs
    @customscriptbuildsconsoleView = new CustomScriptBuildsConsoleView(state.customscriptbuildsconsoleViewState)
    #console.log state
    #atom.workspaceView.appendToBottom(@customscriptbuildsconfigView)
    #console.log @customscriptbuildsconfigView
    #@customscriptbuildsconfigView.destroy()
    #console.log @customscriptbuildsconfigView
    #console.log "activate"
    #console.log @configDefaults
    #atom.config.set('customscriptbuilds.someSetting', '12')
    #console.log atom.config.get('customscriptbuilds.someSetting') # -> 12

  deactivate: ->
    @customscriptbuildsView.destroy()
    #@customscriptbuildsconfigView.destroy()
    #@customscriptbuildsconsoleView.destroy()

  serialize: ->
    customscriptbuildsViewState: @customscriptbuildsView.serialize()
    #customscriptbuildsconfigViewState: @customscriptbuildsconfigView.serialize()
    #customscriptbuildsconsoleViewState: @customscriptbuildsconsoleView.serialize()
