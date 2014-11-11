{WorkspaceView} = require 'atom'
Customscriptbuilds = require '../lib/customscriptbuilds'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Customscriptbuilds", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('customscriptbuilds')

  describe "when the customscriptbuilds:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.customscriptbuilds')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'customscriptbuilds:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.customscriptbuilds')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'customscriptbuilds:toggle'
        expect(atom.workspaceView.find('.customscriptbuilds')).not.toExist()
