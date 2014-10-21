mat_inv = (A) ->
  n = A.length
  m = A[0].length
  if (n isnt 2) or (m isnt 2)
    console.warn 'inv of mat which isnt 2x2 is not supported'

  inv2x2 = (A) ->
    a = A[0][0]
    b = A[0][1]
    c = A[1][0]
    d = A[1][1]
    det = a * d - b * c
    [[ d/det, -b/det]
     [-c/det,  a/det]]

  inv2x2 A

exports.mat_inv = mat_inv
