mat_add = (A, B) ->
  n = Math.min A.length, B.length
  m = Math.min A[0].length, B[0].length
  for i in [0 ... n]
    for j in [0 ... m]
      A[i][j] + B[i][j]

exports.mat_add = mat_add
