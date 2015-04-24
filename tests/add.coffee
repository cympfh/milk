{make_random, mat_add} = require '..'

nearly_eq = (x, y) ->
  (Math.abs x - y) / (Math.min x, y) < 1e-8

n = 2000
A = make_random n, n
B = make_random n, n
C = mat_add A, B

for k in [0..n]
  i = (do Math.random) * n | 0
  j = (do Math.random) * n | 0
  console.assert nearly_eq C[i][j], A[i][j] + B[i][j]

