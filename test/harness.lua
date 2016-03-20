local test = require('lua-tape')

test('string', function (t) 

  t.ok('caal', 'it is cool')
  t.equals(8, 8, 'they are equal')
  t.equals(1, 8, 'they are also equal')
  t.done()
end)
