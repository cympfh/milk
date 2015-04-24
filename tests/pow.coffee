{eye, mat_mul, make_random, mat_pow} = require '..'

## cycle

I = [ [ 1, 0 ], [ 0, 1 ] ]
_I = [ [ -1, 0 ], [ 0, -1 ] ]
C = [ [0, -1], [1,  0] ]
_C = [ [ 0, 1 ], [ -1, 0 ] ]

assert_eq = (n, A, B) ->
  for i in [0 ... n]
    for j in [0 ... n]
      console.assert A[i][j] is B[i][j]

for i in [0 .. 20]
  D = mat_pow C, i
  assert_eq 2, D, ([I, C, _I, _C][i % 4])

## comparison to naiive

my_pow = (A, k) ->
  switch
    when k is 0
      eye A.length
    when k is 1
      A
    when (k % 2) is 0
      B = mat_mul A, A
      my_pow B, k/2
    else
      B = my_pow A, k - 1
      mat_mul A, B

assert_nearly_eq = (n, A, B) ->
  for k in [0 ... n]
    i = n * do Math.random | 0
    j = n * do Math.random | 0
    console.assert A[i][j] is B[i][j]

N = 300
K = 200
A = make_random N, N
B = mat_pow A, K
D = my_pow A, K

assert_nearly_eq N, B, D
