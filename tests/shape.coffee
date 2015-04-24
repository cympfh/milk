{shape, reshape} = require '..'
{assert} = console

A = for i in [0...2]
  for j in [0...4]
    1 + i * 4 + j

[n, m] = shape A
assert n is 2 and m is 4

B = reshape A, 3, 3
[k, l] = shape B
assert k is 3 and l is 3

assert B[2][1] is 8
assert B[2][2] is 0
