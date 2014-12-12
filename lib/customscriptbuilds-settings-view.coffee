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
    @div class: 'settings-view pane-item', tabindex: -1, =>
      @div class: 'config-menu', outlet: 'sidebar', =>
        @ul class: 'panels-menu nav nav-pills nav-stacked', outlet: 'panelMenu', =>
          @div class: 'panel-menu-separator', outlet: 'menuSeparator'
          @div class: 'editor-container settings-filter', =>
            #@span class: 'heading-status icon-sync', outlet: 'icon_restart', click: ''
            #@subview 'filterEditor', new TextEditorView(mini: true, placeholderText: 'Filter packages')
        @ul class: 'panels-packages nav nav-pills nav-stacked', outlet: 'panelPackages'
        #@span class: 'heading-status icon-sync', outlet: 'icon_restart', click: ''
        @div class: 'button-area', =>
          @button class: 'btn btn-default icon icon-link-external', outlet: 'openDotAtom', 'Open ~/.atom'

      #@div class: 'panels padded', outlet: 'panels'
      @div class: 'panels padded', outlet: 'scriptOptionsView', => #non header
        #@div class: 'panel-body padded', =>
          #@div class: 'block', =>
          @label 'It will compile current folder project.'
            #@span class: 'heading-status icon-alert', outlet: 'icon_restart', click: ''
          @label 'Nodejs path bat/cmd:'
          @input
              type: 'text'
              class: 'editor mini native-key-bindings'
              outlet: 'nodejbat'
          @label 'HTML file bat/cmd:'
          @input
              type: 'text'
              class: 'editor mini native-key-bindings'
              outlet: 'htmlbat'
          @label 'Server file bat/cmd:'
          @input
              type: 'text'
              class: 'editor mini native-key-bindings'
              outlet: 'serverbat'

          @div class: 'panel-body padded', =>
            css = 'btn inline-block-tight'
            @button class: "btn #{css}", click: 'SaveConfig', 'Save'
          @label 'Command Line:'

    #@div =>
      #@h1 "The html-tab package is Alive! It's ALIVE!"
      #css = 'btn inline-block-tight'
      #@div class: 'overlay from-top panel', outlet: 'scriptOptionsView', =>
        #@div class: 'panel-heading', 'Configure Run Options'
        #@div class: 'panel-body padded', =>
          #@div class: 'block', =>
            #@select
            #@label 'Setting Name:'


  initialize: ({@uri, activePanelName}={}) ->
    #super
    console.log 'initialize'
    #atom.config.set("customscriptbuilds.showtoolbar", true)
    #bshow = atom.config.get "customscriptbuilds.showtoolbar"
    @nodejbat.val atom.config.get "customscriptbuilds.compilenodejs"
    @htmlbat.val atom.config.get "customscriptbuilds.conpilehtml"
    @serverbat.val atom.config.get "customscriptbuilds.scriptserver"

  SaveConfig: ->
    console.log @serverbat.val()
    atom.config.set("customscriptbuilds.compilenodejs", @nodejbat.val())
    atom.config.set("customscriptbuilds.conpilehtml", @htmlbat.val())
    atom.config.set("customscriptbuilds.scriptserver", @serverbat.val())

  getTitle: ->
    "Custom Script Builds Config"

  getUri: ->
    @uri
