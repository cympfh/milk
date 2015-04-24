{mat_mul} = require '..'

eye = (n) ->
  for i in [1..n]
    for j in [1..n]
      if i is j then 1 else 0

is_eye = (M) ->
  I = M.length
  for i in [0...I]
    for j in [0 ... M[i].length]
      if i is j
        return false if M[i][j] is 0
      else
        return false if M[i][j] isnt 0
  return true

for size in [10, 20, 40, 100]
  I = eye size
  for i in [0 .. 100]
    I = mat_mul I, I
    console.assert is_eye I

