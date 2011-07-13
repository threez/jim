module 'Ace: commands',
  setup: setupAceTests

test 'A', ->
  @press 'Aend'
  eq @adaptor.lineText()[-3..-1], 'end'

test 'C', ->
  @adaptor.moveTo 0, 11

  @press 'Cawesomes'
  eq @adaptor.lineText(), "_.sortBy = awesomes"

test 'D', ->
  @adaptor.moveTo 0, 11

  @press 'D'
  eq @adaptor.lineText(), "_.sortBy = "

test 'I', ->
  @press 'Istart', @esc
  eq @adaptor.lineText()[0..5], 'start_'

  @press 'jIstart', @esc
  eq @adaptor.lineText()[0..7], '  startr'

test 'p', ->
  @press 'y3l2p'
  eq @adaptor.lineText(), "__.s_.s.sortBy = function(obj, iterator, context) {"

test 'x', ->
  @press 'x'
  eq @adaptor.lineText(), ".sortBy = function(obj, iterator, context) {"
  @press '3x'
  eq @adaptor.lineText(), "rtBy = function(obj, iterator, context) {"

test 'X', ->
  @adaptor.moveTo 2, 11

  @press 'X'
  eq @adaptor.lineText(), "    return{"
  @press 'X'
  eq @adaptor.lineText(), "    retur{"
  @press '9X'
  eq @adaptor.lineText(), "{"
  @press 'X'
  eq @adaptor.lineText(), "{"

test 'o,O', ->
  @press 'Onew line', @esc
  eq @adaptor.lineText(), "new line"
  eq @adaptor.row(), 0
  eq @adaptor.lastRow(), 16

  @press 'oanother line', @esc
  eq @adaptor.lineText(), 'another line'
  eq @adaptor.row(), 1
  eq @adaptor.lastRow(), 17
