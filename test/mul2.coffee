{mul} = require '../milk'

naiiv_mul = (u, v) ->

  n = u.length
  add = (x, y) -> x + y

  for i in [0 ... n]
    for j in [0 ... n]
      (u[i][k] * v[k][j] for k in [0 ... n]).reduce add

equal = (u, v) ->
  n = u.length
  m = u[0].length
  for i in [0 ... n]
    for j in [0 ... m]
      return false if u[i][j] isnt v[i][j]
  true

make = (n) ->
  for i in [0 ... n]
    for j in [0 ... n]
      do Math.random

for n in [2 .. 20]

  # two random Matrices
  a = make n
  b = make n

  c = mul a, b
  d = naiiv_mul a, b

  console.assert (equal c, d), "#{c} #{d}"

