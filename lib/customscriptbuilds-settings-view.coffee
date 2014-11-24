#customscriptbuilds-config-view


path = require 'path'
_ = require 'underscore-plus'
{View, TextEditorView} = require 'atom'
#async = require 'async'
#CSON = require 'season'

module.exports =
class CustomScriptBuildsSettingsView extends View
  #@bufferedProcess: null
  @content: ->
    @div =>
      @h1 "The html-tab package is Alive! It's ALIVE!"
      css = 'btn inline-block-tight'
      @div class: 'overlay from-top panel', outlet: 'scriptOptionsView', =>
        @div class: 'panel-heading', 'Configure Run Options'
        @div class: 'panel-body padded', =>
          @div class: 'block', =>
            @select
            @label 'Setting Name:'





  initialize: ({@uri, activePanelName}={}) ->
    #super
    console.log 'initialize'

  getTitle: ->
    "Custom Script Builds Config"

  getUri: ->
    @uri
