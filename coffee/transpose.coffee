transpose = (A) ->
  n = A.length
  m = A[0].length
  for i in [0...m]
    for j in [0...n]
      A[j][i]

exports.transpose = transpose
