CustomscriptbuildsView = require './customscriptbuilds-view'

module.exports =
  customscriptbuildsView: null

  activate: (state) ->
    @customscriptbuildsView = new CustomscriptbuildsView(state.customscriptbuildsViewState)

  deactivate: ->
    @customscriptbuildsView.destroy()

  serialize: ->
    customscriptbuildsViewState: @customscriptbuildsView.serialize()
