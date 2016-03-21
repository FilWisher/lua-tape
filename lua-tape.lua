local harness = require('./harness')

function test (name, cb)
  local h = harness:new()
  print('# ' .. name)
  cb(h)
end

return test
