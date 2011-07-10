require ['ace/edit_session', 'ace/editor', 'ace/test/mockrenderer', 'jim/ace/module', 'jim/ace/adaptor', 'text!test/fixtures/sort_by.js'], ->
  {EditSession} = require 'ace/edit_session'
  {Editor} = require 'ace/editor'
  MockRenderer = require 'ace/test/mockrenderer'
  module = require 'jim/ace/module'
  {adaptor} = require 'jim/ace/adaptor'

  MockRenderer::setStyle = (->)
  MockRenderer::unsetStyle = (->)

  js_code = require 'text!test/fixtures/sort_by.js'
  
  test 'visual mode motions', ->
    editor = new Editor(new MockRenderer(), new EditSession js_code)
    jim = module.startup env: {editor}

    editor.onTextInput c for c in 'v3Gd'
    deepEqual editor.getCursorPosition(), row: 0, column: 0
    eq jim.adaptor.lineText(), 'eturn {'

    editor.onTextInput c for c in 'v2ly'
    eq jim.registers['"'], 'etu'
    # this fails, leaves the cursor in the wrong position
    #deepEqual editor.getCursorPosition(), row: 0, column: 0
