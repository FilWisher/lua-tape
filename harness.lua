local deepequal = require('deps/deep-equal')

local harness = {}

harness['count'] = 0
harness['failed'] = 0

function harness.ok(value, description) 
  harness['count'] = harness['count'] + 1
  if (value) then
    harness.pass(description)
  else
    harness.fail(description)
  end
end

function harness.equals(a, b, description)
  harness['count'] = harness['count'] + 1
  
  if a == b then
    harness.pass(description)
  else
    harness.fail(description)
  end
end

function harness.deepEquals(a, b, description)
  harness['count'] = harness['count'] + 1
  if a == b then harness.pass(description) end
  if type(a) == 'table' then
    if deepequal(a, b, '') then
      harness.pass(description)
    else
      harness.fail(description)
    end
  else
    harness.fail(description) 
  end
  
end

function harness.pass(description)
  print('ok ' .. tostring(harness['count']) .. ' - ' .. description)
end

function harness.fail(description)
  harness['failed'] = harness['failed'] + 1
  print('not ok ' .. tostring(harness['count']) .. ' - ' .. description)
end

function harness.done()
  print()
  print('1..' .. tostring(harness['count']))
  print('# tests\t' .. tostring(harness['count']))
  print('# pass\t' .. tostring(harness['count'] - harness['failed']))
  if harness['failed'] > 0 then
    print('# fail\t' .. tostring(harness['failed']) )
  end
end

return harness
