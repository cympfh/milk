mat_scale = (k, A) ->

  process.assert (typeof k) is 'number'
  process.assert A.length and A[0]?.length

  n = A.length
  m = A[0].length

  for i in [0 ... n]
    for j in [0 ... m]
      k * A[i][j]

exports.mat_scale = mat_scale
