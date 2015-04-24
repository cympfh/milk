{shape, make_random, transpose} = require '..'
{assert} = process

n = 2000
m = 500
A = make_random n, m
B = transpose A

assert (shape B)[0] is (shape A)[1]

for k in [0 ... n]
  i = n * do Math.random | 0
  j = m * do Math.random | 0
  assert A[i][j] is B[j][i]

