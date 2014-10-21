{make_random, mat_eq} = require 'milk'

console.assert mat_eq [[1]], [[1]]
console.assert not mat_eq [[1]], [[2]]

for i in [0 ... 100]
  A = make_random 2, 2
  console.assert mat_eq A, A
  B = make_random 2,2
  console.assert not mat_eq A, B
