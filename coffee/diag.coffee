diag = (xs) ->
  n = xs.length
  v = [ 0 ... n ]
  for i in v
    for j in v
      if i is j then xs[i] else 0

exports.diag = diag
