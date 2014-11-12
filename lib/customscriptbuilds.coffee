CustomscriptbuildsView = require './customscriptbuilds-view'
CustomScriptBuildsConfigView = require './customscriptbuilds-config-view'


module.exports =
  customscriptbuildsView: null
  CustomScriptBuildsConfigView: null

  activate: (state) ->
    @customscriptbuildsconfigView = new CustomScriptBuildsConfigView(state.customscriptbuildsViewState)
    @customscriptbuildsView = new CustomscriptbuildsView(state.customscriptbuildsViewState)

  deactivate: ->
    @customscriptbuildsView.destroy()
    @customscriptbuildsconfigView.destroy()

  serialize: ->
    customscriptbuildsViewState: @customscriptbuildsView.serialize()
    customscriptbuildsconfigViewState: @customscriptbuildsconfigView.serialize()
