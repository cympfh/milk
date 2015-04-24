{diag, mat_eq} = require '..'

console.assert mat_eq [[1, 0], [0, 2]], diag [1, 2]
