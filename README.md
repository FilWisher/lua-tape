# lua-tape
playing with rewriting substack/tape for luvit

## use

```lua
local test = require('lua-tape')

test('are equal', function (t)
  t.ok(8, 'the value 8 is truthy')
  t.equals(8, 9, 'the values 8 and 9 are equal')
  t.done()
end)
```

## api

### test(description, cb)
Create a new test with description. cb is called and passed a harness (t)

### t.ok(value, description)
Assert that the value of t is truthy and print description

### t.equals(value1, value2, description)
Assert that values 1 and 2 are equal and print description

### t.deepEquals(obj1, obj2, description)
Assert that values 1 and 2 are deeply equal - in a recursive comparison, their properties are all equal
