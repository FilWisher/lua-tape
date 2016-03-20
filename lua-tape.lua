local harness = require('harness')

function test (string, cb)
  cb(harness)
end

return test
