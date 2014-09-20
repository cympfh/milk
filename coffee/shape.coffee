shape = (A) ->
  [A.length, A[0].length]

reshape = (A, n, m) ->
  list = [].concat.apply [], A
  I = list.length
  for i in [0...n]
    for j in [0...m]
      idx = i * n + j
      if idx < I then list[idx] else 0

exports.shape = shape
exports.reshape = reshape
