{eye, make_random, mat_eq, mat_inv, mat_mul} = require '..'

A = eye 2
console.assert mat_eq (mat_inv A), A

for i in [0 ... 100]
  A = make_random 2, 2
  B = mat_inv A
  console.assert (eye 2), (mat_mul A, B)
