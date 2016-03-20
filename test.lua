local test = require('lua-tape')

test('string', function (t) 

  t.ok('caal', 'it is cool')
  t.equals(8, 8, 'they are equal')
  t.equals(1, 8, 'should be NOT equal')
  
  
  t.deepEquals({ ok = true, notOk = false },
               { ok = true, notOk = false },
               'should be equal')
  
  t.deepEquals({ ok = true, notOk = false },
               { ok = false, notOk = true },
               'should NOT be equal')
  t.done()
end)
