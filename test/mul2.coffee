{mul} = require '../milk'

naiiv_mul = (u, v) ->

  n = u.length
  m = v.length
  l = v[0].length

  add = (x, y) -> x + y

  for i in [0 ... n]
    for j in [0 ... l]
      (u[i][k] * v[k][j] for k in [0 ... m]).reduce add

equal = (u, v) ->

  n = u.length
  m = u[0].length

  for i in [0 ... n]
    for j in [0 ... m]

      if (not u[i]?[j]?) or (not v[i]?[j]?)
        throw new Error "Matrix shape Error: #{u} #{v}"

      return false if u[i][j] isnt v[i][j]
  true

#
# 正方行列
#
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

#
# 正方形じゃない
#
rect = (n, m) ->
  for i in [0 ... n]
    for j in [0 ... m]
      do Math.random

for n in [3 .. 7]
  for m in [3 .. 7]
    for l in [3 .. 7]

      a = rect n, m
      b = rect m, l

      c = mul a, b
      d = naiiv_mul a, b

      console.assert (equal c, d), "#{[n, m, l]}"

