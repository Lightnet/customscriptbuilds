###
 Project Name: Custom Script Builds
 Link: https://github.com/Lightnet/customscriptbuilds
 License: MIT
 Information: To run typescript for server hosting for better style format flow.
 To create a simple work flow layout. For browser game or application for html.

###

{View} = require 'atom'

module.exports =
class CustomScriptBuildsConfigView extends View
  #options = atom.config.getSchema(keyPath)?.enum ? []
  options = ["ts","js","coffee","html"]
  predefinenames = ["typescript"]
  @content: ->
    @div =>
      css = 'btn inline-block-tight'
      @div class: 'overlay from-top panel', outlet: 'scriptOptionsView', =>
        @div class: 'panel-heading', 'Configure Run Options'
        @div class: 'panel-body padded', =>
          @div class: 'block', =>
            @select
            @label 'Setting Name:'

            @input
              type: 'text'
              class: 'editor mini native-key-bindings'
              outlet: 'inputSettingName'
            @select class: 'form-control', =>
              for option in predefinenames
                @option value: option, option
                #console.log option

            @label 'Ext Type:'
            @select class: 'form-control', =>
              for option in options
                @option value: option, option
                #console.log option
            @button class: "btn #{css}", click: 'close', 'Refresh'
            @button class: "btn #{css}", click: 'close', 'Save'
            @button class: "btn #{css}", click: 'close', 'Delete'
            @button class: "btn #{css}", click: 'setvar', 'Set'
          @div class: 'block', =>
        @div class: 'panel-body padded', =>
          @div class: 'block', =>
            @label 'Current Working Directory:'
            @input
              type: 'text'
              class: 'editor mini native-key-bindings'
              outlet: 'inputCwd'
          @div class: 'block', =>
            @label 'Command'
            @input
              type: 'text'
              class: 'editor mini native-key-bindings'
              outlet: 'inputCommand'
          @div class: 'block', =>
            @label 'Command Arguments:'
            @input
              type: 'text'
              class: 'editor mini native-key-bindings'
              outlet: 'inputCommandArgs'
          @div class: 'block', =>
            @label 'Program Arguments:'
            @input
              type: 'text'
              class: 'editor mini native-key-bindings'
              outlet: 'inputScriptArgs'
          @div class: 'block', =>
            @label 'Environment Variables:'
            @input
              type: 'text'
              class: 'editor mini native-key-bindings'
              outlet: 'inputEnv'
          @div class: 'block', =>
            css = 'btn inline-block-tight'
            @button class: "btn #{css}", click: 'close', 'Close'
            @button class: "btn #{css}", click: 'run', 'Run'


  initialize: (@runOptions) ->
    #console.log "init"
    atom.workspaceView.command 'customscriptbuilds:run-configs', => @toggleScriptOptions()
    atom.workspaceView.command 'customscriptbuilds:close-config', =>
      @toggleScriptOptions 'hide'
    atom.workspaceView.command 'customscriptbuilds:save-options', => @saveOptions()
    atom.workspaceView.prependToTop this
    @toggleScriptOptions 'hide'
    #console.log this

  toggleScriptOptions: (command) ->
    #console.log command
    #console.log this.hide()
    #@CustomScriptBuildsConfigView.hide()
    switch command
      when "show" then this.show() #@CustomScriptBuildsConfigView.show()
      when "hide" then this.hide() #@CustomScriptBuildsConfigView.hide()
      else this.toggle() #@CustomScriptBuildsConfigView.toggle()

  saveOptions: ->
    #console.log "save options"
    #splitArgs = (element) ->
      #item for item in element.val().split ' ' when item isnt ''

    #console.log element

    console.log @inputSettingName.val()
    console.log @inputCwd.val()
    console.log @inputCommand.val()
    console.log @inputCommandArgs.val()
    console.log @inputScriptArgs.val()
    console.log @inputEnv.val()


  close: ->
    atom.workspaceView.trigger 'customscriptbuilds:close-config'

  run: ->
    atom.workspaceView.trigger 'customscriptbuilds:save-options'
    atom.workspaceView.trigger 'customscriptbuilds:close-config'
    atom.workspaceView.trigger 'customscriptbuilds:run'

  setvar: ->
    #@inputEnv.val("test") #work
    @inputEnv.val "test" #work
