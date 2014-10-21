mat_eq = (A, B) ->
  n_a = A.length
  m_a = A[0].length
  n_b = B.length
  m_b = B[0].length

  if n_a isnt n_b
    return false

  if m_a isnt m_b
    return false

  for i in [0 ... n_a]
    al = A[i]
    bl = B[i]
    for j in [0 ... m_a]
      if al[j] isnt bl[j]
        return false

  return true

exports.mat_eq = mat_eq
exports.mat_equal = mat_eq
