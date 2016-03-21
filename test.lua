local test = require('./lua-tape')

test('deepEquals', function (t) 
 
  t:deepEquals({ ok = true, notOk = false },
               { ok = true, notOk = false },
               'same structure should be equal')
  
  t:deepEquals({ ok = true, notOk = false, cool = { ace = 8 } },
               { ok = true, notOk = false, cool = { ace = 8 } },
               'same nested structure should be equal')
 
  local obj = { ok = true, notOk = false, cool = { ace = 8 } }
  t:deepEquals(obj, obj, 'same reference should be equal')
  
  t:done()
end)

test('numbers', function (t)
  math.randomseed(os.time())
  for i = 1, 10 do
    a = math.random()
    b = math.random()
    t:equals(a, a, tostring(a) .. 'equals itself')
    t:equals(b, b, tostring(b) .. 'equals itself')
    if a == b then
      t:equals(a, b, 
        tostring(a) .. ' and ' .. tostring(b) .. ' are equal')
    else
      t:notEquals(a, b, 
        tostring(a) .. ' and ' .. tostring(b) .. ' are not equal')
    end
  end
  t:equals(0, 0, '0 == 0')
  t:equals(-1, -1, '-1 == -1')
  t:notEquals(0, -1, '0 == 0')
  t:done()
end)

test('booleans', function (t)
  t:equals(true, true, 'true are equal')
  t:equals(false, false, 'false are equal')
  t:notEquals(true, false, 'false are not equal')
  t:notEquals(false, true, 'true are not equal')
  t:ok(true, 'true is ok')
  t:notOk(false, 'false is not ok')
  t:done()
end)

test('booleans', function (t)
  t:pass('nono')
  t:done()
end)
