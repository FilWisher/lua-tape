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
  if (a == b) then
    harness.pass(description)
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
  print('test done')
  if harness['failed'] > 0 then
   
    local msg = 'Failed ' .. tostring(harness['failed']) .. 
                '/' .. tostring(harness['count']) .. ' tests'
    local percentage = tostring(harness['failed'] / harness['count'] * 100)
    print(msg .. ', ' .. percentage .. '% okay')
  end
end

return harness
