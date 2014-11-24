###
 Project Name: Custom Script Builds
 Link: https://github.com/Lightnet/customscriptbuilds
 License: MIT
 Information: To run typescript for server hosting for better style format flow.
 To create a simple work flow layout. For browser game or application for html.
###
AnsiFilter = require 'ansi-to-html'
_ = require 'underscore'
{View, BufferedProcess, $$} = require 'atom'

module.exports =
class CustomScriptBuildsConsoleView extends View
  @bufferedProcess: null
  @compilemode: "nodejs"

  @content: ->
    #@div class: 'overlay from-top panel', outlet: 'scriptOptionsView', => #non header
    @div class: 'panel-heading padded heading header-view', => #header
      @span class: 'heading-title', outlet: 'title'
      @span class: 'heading-status', outlet: 'status'
      @span
        class: 'heading-close icon-remove-close pull-right'
        outlet: 'closeButton'
        click: 'close'
      @span
          class: "heading-close icon-jump-down pull-right"
          outlet: 'icon_toggleconsole'
          click: 'toggleoutput'
        # Display layout and outlets
      @div class: 'block', =>
        css = 'tool-panel panel panel-bottom padding script-view
          native-key-bindings'
        @div class: css, outlet: 'script', tabindex: -1, =>
          @div class: 'panel-body padded output', outlet: 'output'

  initialize: (@runOptions) ->
    @ansiFilter = new AnsiFilter
    @title.text  'console'
    @setStatus  'start'
    #console.log "init console"
    #atom.workspaceView.command 'customscriptbuilds:open-console', => @toggleScriptOptions()
    #atom.workspaceView.command 'customscriptbuilds:close-console', =>
      #@toggleScriptOptions 'hide'
    #@toggleScriptOptions 'hide'
    #console.log this
    atom.workspaceView.command 'customscriptbuilds:compile-nodejs', => @build_nodejs()
    atom.workspaceView.command 'customscriptbuilds:compile-html', => @build_html()

    atom.workspaceView.command 'customscriptbuilds:open-console', => @toggleScriptConsole()
    atom.workspaceView.command 'customscriptbuilds:close-console', =>
      @toggleScriptConsole 'hide'
    #atom.workspaceView.command 'customscriptbuilds:save-console', => @saveOptions()
    atom.workspaceView.prependToTop this
    @toggleScriptConsole 'hide'

  build_nodejs:->
        console.log 'run_nodejs'
        @compilemode = 'nodejs'
        #"%APPDATA%\npm\tsc.cmd" --module commonjs  "server_express.ts" --removeComments
        @run('compilenodejs.bat','','')
        #@run("%APPDATA%\npm\tsc.cmd",'','')

  build_html:->
        console.log 'run_html'
        @compilemode = 'html'
        #"%APPDATA%\npm\tsc.cmd" --module commonjs  "js_client/script_html.ts" --removeComments
        @run("compilehtml.bat",'','')


  toggleoutput: ->
    @icon_toggleconsole.removeClass 'icon-jump-up icon-jump-down'
    console.log "toggle output"
    if @script.isVisible() == true
      @icon_toggleconsole.addClass 'icon-jump-up'
      @script.hide()
    else
      @icon_toggleconsole.addClass 'icon-jump-down'
      @script.show()

  toggleScriptConsole: (command) ->
    #console.log command
    #console.log this.hide()
    #@CustomScriptBuildsConfigView.hide()
    switch command
      when 'show' then this.show() #@CustomScriptBuildsConfigView.show()
      when 'hide' then this.hide() #@CustomScriptBuildsConfigView.hide()
      else this.toggle() #@CustomScriptBuildsConfigView.toggle()
    #console.log "toggle console"

  close: ->
    atom.workspaceView.trigger 'customscriptbuilds:close-console'

  setStatus: (status) ->
    @status.removeClass 'icon-alert icon-check icon-hourglass icon-stop'
    switch status
      when 'start' then @status.addClass 'icon-hourglass'
      when 'stop' then @status.addClass 'icon-check'
      when 'kill' then @status.addClass 'icon-stop'
      when 'err' then @status.addClass 'icon-alert'

  run: (command, extraArgs, codeContext) ->
    atom.emit 'achievement:unlock', msg: 'Homestar Runner'
    startTime = new Date()
    stdout = (output) => @display 'stdout', output
    stderr = (output) => @display 'stderr', output

    options =
      cwd: @getCwd()
    #args = ['help']
    #args = ['cd']
    #check scirpt package for atom.
    #args = codeContext.shebangCommandArgs().concat args
    args = ''

    editor = atom.workspace.getActiveTextEditor()
    console.log editor.getUri()
    console.log editor.getTitle()
    args = [editor.getTitle()]

    console.log @compilemode

    if @compilemode == 'nodejs'
          console.log 'found nodjs'
          args = []
    if @compilemode == 'html'
          console.log 'found html'
          args = []

    exit = (returnCode) =>
      if returnCode is 0
        @setStatus 'stop'
        console.log 'stop'
      else
        @setStatus 'err'
      console.log "Exited with #{returnCode}"

    # Run process
    @bufferedProcess = new BufferedProcess({
      command, args, options, stdout, stderr, exit
    })

    @toggleScriptConsole 'show'
    #console.log @bufferedProcess
    #console.log $
    #@output.append('Unable to run' )
    @bufferedProcess.process.on 'exit', =>
      #console.log("Finished", new Date().getTime());
      executionTime = (new Date().getTime() - startTime.getTime()) / 1000
      @display 'stdout', '[Finished in '+executionTime.toString()+'s]'

    @bufferedProcess.process.on 'error', (nodeError) =>
      @output.append $$ ->
        @h1 'Unable to run'
        @pre _.escape command
        @h2 'Is it on your path?'
        @pre "PATH: #{_.escape process.env.PATH}"

  getCwd: ->
    #if not @runOptions.workingDirectory? or @runOptions.workingDirectory is ''
      #atom.project.getPath()
    #else
      #@runOptions.workingDirectory
    atom.project.getPath()

  stop: ->
    # Kill existing process if available
    if @bufferedProcess? and @bufferedProcess.process?
      @display 'stdout', '^C'
      #@headerView.setStatus 'kill'
      @bufferedProcess.kill()
  display: (css, line) ->
    #console.log line
    line = _.escape(line)
    #console.log line
    #console.log @ansiFilter
    console.log @ansiFilter

    line = @ansiFilter.toHtml line

    @output.append $$ ->
      @pre class: "line #{css}", =>
        @raw line

  defaultRun: ->
    @resetView()
    #codeContext = @buildCodeContext() # Until proven otherwise
    #@start(codeContext) unless not codeContext?

  resetView: (title = 'Loading...') ->
    # Display window and load message
    # First run, create view
    #atom.workspaceView.prependToBottom this unless @hasParent()
    # Close any existing process and start a new one
    @stop()
    @title.text title
    @setStatus 'start'
    # Get script view ready
    @output.empty()

  buildCodeContext:(argType='Selection Based') ->
    # Get current editor
    editor = atom.workspace.getActiveEditor()
    # No editor available, do nothing
    return unless editor?
    codeContext = @initCodeContext(editor)
    codeContext.argType = argType

    if argType == 'Line Number Based'
      editor.save()
    else if codeContext.selection.isEmpty() and codeContext.filepath?
      codeContext.argType = 'File Based'
      editor.save()

    # Selection and Line Number Based runs both benefit from knowing the current line
    # number
    unless argType == 'File Based'
      cursor = editor.getCursor()
      codeContext.lineNumber = cursor.getScreenRow() + 1

    return codeContext

  start: (codeContext) ->

    # If language was not determined, do nothing
    if not codeContext.lang?
      # In the future we could handle a runner without the language being part
      # of the grammar map, using the options runner
      return

    commandContext = @setupRuntime codeContext
    @run commandContext.command, commandContext.args, codeContext if commandContext

  initCodeContext: (editor) ->
    filename = editor.getTitle()
    filepath = editor.getPath()
    selection = editor.getSelection()

    # If the selection was empty "select" ALL the text
    # This allows us to run on new files
    if selection.isEmpty()
      textSource = editor
    else
      textSource = selection

    codeContext = new CodeContext(filename, filepath, textSource)
    codeContext.selection = selection
    codeContext.shebang = @getShebang(editor)

    # Get language
    lang = @getLang editor

    if @validateLang lang
      codeContext.lang = lang

    return codeContext
