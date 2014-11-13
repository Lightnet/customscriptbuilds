###
 Project Name: Custom Script Builds
 Link: https://github.com/Lightnet/customscriptbuilds
 License: MIT
 Information: To run typescript for server hosting for better style format flow.
 To create a simple work flow layout. For browser game or application for html.

###

#main file that run the scripts for the coffee build api of the atom

CustomscriptbuildsView = require './customscriptbuilds-view'
CustomScriptBuildsConfigView = require './customscriptbuilds-config-view'
CustomScriptBuildsConsoleView = require './customscriptbuilds-console-view'

CustomScriptBuildsToolbarView = require './customscriptbuilds-toolbar-view'

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
    atom.workspaceView.appendToBottom(@customscriptbuildsconsoleView)

    @customscriptbuildstoolbarView = new CustomScriptBuildsToolbarView(state.customscriptbuildstoolbarViewState)
    atom.workspaceView.appendToTop(@customscriptbuildstoolbarView)
    #atom.workspaceView.appendToBottom(@customscriptbuildstoolbarView)

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
