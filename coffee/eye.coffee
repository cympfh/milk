eye = (n) ->
  for i in [0 ... n]
    for j in [0 ... n]
      if i is j then 1 else 0

exports.eye = eye
