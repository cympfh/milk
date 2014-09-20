{mat_scale, eye} = require '..'

n = 2000
m = 1000
A = for i in [0 ... n]
  for j in [0 ... m]
    i

B = mat_scale 2, A

for k in [0 ... n]
  i = n * do Math.random | 0
  j = m * do Math.random | 0
  console.assert ((2 * A[i][j]) is B[i][j]), "#{A[i][j]} , #{B[i][j]}"
