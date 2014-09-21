eye = (n, m = false) ->
  m = n if not m
  for i in [0 ... n]
    for j in [0 ... m]
      if i is j then 1 else 0

exports.eye = eye
