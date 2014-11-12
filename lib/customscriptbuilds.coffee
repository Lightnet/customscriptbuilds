CustomscriptbuildsView = require './customscriptbuilds-view'
CustomScriptBuildsConfigView = require './customscriptbuilds-config-view'


module.exports =
  customscriptbuildsView: null
  customscriptbuildsconfigView: null

  activate: (state) ->
    #console.log state
    @customscriptbuildsView = new CustomscriptbuildsView(state.customscriptbuildsViewState)
    #@customscriptbuildsView = new CustomscriptbuildsView()
    #console.log state
    @customscriptbuildsconfigView = new CustomScriptBuildsConfigView(state.customscriptbuildsconfigViewState)
    #console.log state
    #atom.workspaceView.appendToBottom(@customscriptbuildsconfigView)
    #console.log @customscriptbuildsconfigView
    #@customscriptbuildsconfigView.destroy()
    #console.log @customscriptbuildsconfigView

  deactivate: ->
    @customscriptbuildsView.destroy()
    @customscriptbuildsconfigView.destroy()

  serialize: ->
    customscriptbuildsViewState: @customscriptbuildsView.serialize()
    customscriptbuildsconfigViewState: @customscriptbuildsconfigView.serialize()
