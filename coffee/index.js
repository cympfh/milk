// Generated by CoffeeScript 1.9.1
(function() {
  var diag, eye, make_random, mat_add, mat_eq, mat_inv, mat_neg, mat_scale, mat_sub, reshape, shape, transpose;

  diag = function(xs) {
    var i, j, l, len, n, o, results, results1, v;
    n = xs.length;
    v = (function() {
      results = [];
      for (var l = 0; 0 <= n ? l < n : l > n; 0 <= n ? l++ : l--){ results.push(l); }
      return results;
    }).apply(this);
    results1 = [];
    for (o = 0, len = v.length; o < len; o++) {
      i = v[o];
      results1.push((function() {
        var len1, p, results2;
        results2 = [];
        for (p = 0, len1 = v.length; p < len1; p++) {
          j = v[p];
          if (i === j) {
            results2.push(xs[i]);
          } else {
            results2.push(0);
          }
        }
        return results2;
      })());
    }
    return results1;
  };

  exports.diag = diag;

  eye = function(n, m) {
    var i, j, l, ref, results;
    if (m == null) {
      m = false;
    }
    if (!m) {
      m = n;
    }
    results = [];
    for (i = l = 0, ref = n; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
      results.push((function() {
        var o, ref1, results1;
        results1 = [];
        for (j = o = 0, ref1 = m; 0 <= ref1 ? o < ref1 : o > ref1; j = 0 <= ref1 ? ++o : --o) {
          if (i === j) {
            results1.push(1);
          } else {
            results1.push(0);
          }
        }
        return results1;
      })());
    }
    return results;
  };

  exports.eye = eye;

  mat_add = function(A, B) {
    var i, j, l, m, n, ref, results;
    n = Math.min(A.length, B.length);
    m = Math.min(A[0].length, B[0].length);
    results = [];
    for (i = l = 0, ref = n; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
      results.push((function() {
        var o, ref1, results1;
        results1 = [];
        for (j = o = 0, ref1 = m; 0 <= ref1 ? o < ref1 : o > ref1; j = 0 <= ref1 ? ++o : --o) {
          results1.push(A[i][j] + B[i][j]);
        }
        return results1;
      })());
    }
    return results;
  };

  mat_sub = function(A, B) {
    var i, j, l, m, n, ref, results;
    n = Math.min(A.length, B.length);
    m = Math.min(A[0].length, B[0].length);
    results = [];
    for (i = l = 0, ref = n; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
      results.push((function() {
        var o, ref1, results1;
        results1 = [];
        for (j = o = 0, ref1 = m; 0 <= ref1 ? o < ref1 : o > ref1; j = 0 <= ref1 ? ++o : --o) {
          results1.push(A[i][j] - B[i][j]);
        }
        return results1;
      })());
    }
    return results;
  };

  mat_neg = function(A) {
    var i, j, l, m, n, ref, results;
    n = A.length;
    m = A[0].length;
    results = [];
    for (i = l = 0, ref = n; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
      results.push((function() {
        var o, ref1, results1;
        results1 = [];
        for (j = o = 0, ref1 = m; 0 <= ref1 ? o < ref1 : o > ref1; j = 0 <= ref1 ? ++o : --o) {
          results1.push(-A[i][j]);
        }
        return results1;
      })());
    }
    return results;
  };

  exports.mat_add = mat_add;

  exports.mat_sub = mat_sub;

  exports.mat_neg = mat_neg;

  mat_eq = function(A, B) {
    var al, bl, i, j, l, m_a, m_b, n_a, n_b, o, ref, ref1;
    n_a = A.length;
    m_a = A[0].length;
    n_b = B.length;
    m_b = B[0].length;
    if (n_a !== n_b) {
      return false;
    }
    if (m_a !== m_b) {
      return false;
    }
    for (i = l = 0, ref = n_a; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
      al = A[i];
      bl = B[i];
      for (j = o = 0, ref1 = m_a; 0 <= ref1 ? o < ref1 : o > ref1; j = 0 <= ref1 ? ++o : --o) {
        if (al[j] !== bl[j]) {
          return false;
        }
      }
    }
    return true;
  };

  exports.mat_eq = mat_eq;

  exports.mat_equal = mat_eq;

  mat_inv = function(A) {
    var inv2x2, m, n;
    n = A.length;
    m = A[0].length;
    if ((n !== 2) || (m !== 2)) {
      console.warn('inv of mat which isnt 2x2 is not supported');
    }
    inv2x2 = function(A) {
      var a, b, c, d, det;
      a = A[0][0];
      b = A[0][1];
      c = A[1][0];
      d = A[1][1];
      det = a * d - b * c;
      return [[d / det, -b / det], [-c / det, a / det]];
    };
    return inv2x2(A);
  };

  exports.mat_inv = mat_inv;

  mat_scale = function(k, A) {
    var i, j, l, m, n, ref, ref1, results;
    process.assert((typeof k) === 'number');
    process.assert(A.length && ((ref = A[0]) != null ? ref.length : void 0));
    n = A.length;
    m = A[0].length;
    results = [];
    for (i = l = 0, ref1 = n; 0 <= ref1 ? l < ref1 : l > ref1; i = 0 <= ref1 ? ++l : --l) {
      results.push((function() {
        var o, ref2, results1;
        results1 = [];
        for (j = o = 0, ref2 = m; 0 <= ref2 ? o < ref2 : o > ref2; j = 0 <= ref2 ? ++o : --o) {
          results1.push(k * A[i][j]);
        }
        return results1;
      })());
    }
    return results;
  };

  exports.mat_scale = mat_scale;

  make_random = function(n, m) {
    var i, j, l, ref, results;
    results = [];
    for (i = l = 0, ref = n; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
      results.push((function() {
        var o, ref1, results1;
        results1 = [];
        for (j = o = 0, ref1 = m; 0 <= ref1 ? o < ref1 : o > ref1; j = 0 <= ref1 ? ++o : --o) {
          results1.push(Math.random());
        }
        return results1;
      })());
    }
    return results;
  };

  exports.make_random = make_random;

  shape = function(A) {
    return [A.length, A[0].length];
  };

  reshape = function(A, n, m) {
    var I, i, idx, j, l, list, ref, results;
    list = [].concat.apply([], A);
    I = list.length;
    results = [];
    for (i = l = 0, ref = n; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
      results.push((function() {
        var o, ref1, results1;
        results1 = [];
        for (j = o = 0, ref1 = m; 0 <= ref1 ? o < ref1 : o > ref1; j = 0 <= ref1 ? ++o : --o) {
          idx = i * n + j;
          if (idx < I) {
            results1.push(list[idx]);
          } else {
            results1.push(0);
          }
        }
        return results1;
      })());
    }
    return results;
  };

  exports.shape = shape;

  exports.reshape = reshape;

  transpose = function(A) {
    var i, j, l, m, n, ref, results;
    n = A.length;
    m = A[0].length;
    results = [];
    for (i = l = 0, ref = m; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
      results.push((function() {
        var o, ref1, results1;
        results1 = [];
        for (j = o = 0, ref1 = n; 0 <= ref1 ? o < ref1 : o > ref1; j = 0 <= ref1 ? ++o : --o) {
          results1.push(A[j][i]);
        }
        return results1;
      })());
    }
    return results;
  };

  exports.transpose = transpose;

}).call(this);
