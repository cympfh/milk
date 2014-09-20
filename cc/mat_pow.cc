#include <node.h>
#include <v8.h>
#include "mat_pow.h"
#include <vector>

#ifdef DEBUG
#include <iostream>
#endif

using namespace v8;

std::vector<std::vector<double> >
mul(
    int n,
    std::vector<std::vector<double> > a,
    std::vector<std::vector<double> > b) {

  std::vector<std::vector<double> > r(n);
  
  for (int i=0; i<n; ++i) {
    std::vector<double> line(n);
    for (int j=0; j<n; ++j) {
      double ac = 0;
      for (int k=0; k<n; ++k) {
        ac += a[i][k] * b[k][j];
      }
#ifdef DEBUG
      std::cerr << ac << std::endl;
#endif
      line[j] = ac;
    }
    r[i] = line;
  }

  return r;
}

std::vector<std::vector<double> > eye(int n) {
  std::vector<std::vector<double> > r(n);
  for (int i=0; i<n; ++i) {
    std::vector<double> line(n);
    for (int j=0; j<n; ++j) {
      line[j] = i == j ? 1 : 0;
    }
    r[i] = line;
  }
  return r;
}

std::vector<std::vector<double> >
solve(int n, std::vector<std::vector<double> > d, int k) {
  if (k < 0) {
    return d;
  }
  else if (k == 0) {
    return eye(n);
  }
  else if (k == 1) {
    return d;
  }
  else if (k & 1) {
    std::vector<std::vector<double> > e = solve(n, d, k - 1);
    return mul(n, d, e);
  }
  else {
    d = mul(n, d, d);
    return solve(n, d, k >> 1);
  }
  return d;
}

Handle<Value> MatPow(const Arguments& args) {
  HandleScope scope;

  // type check of args
  if ( !args[0]->IsArray()
    || !args[1]->IsNumber()) {
    Local<String> msg = String::New("mat_pow :: (Matrix, Int) -> Matrix");
    ThrowException(Exception::TypeError(msg));
    return scope.Close(Undefined());
  }

  // cast args
  Local<Array> a = Local<Array>::Cast(args[0]);

  // iteration number
  int k = args[1]->NumberValue();

  // size
  int n = a->Length();

  std::vector<std::vector<double> > c;

  for (int i=0; i<n; ++i) {
    std::vector<double> d;
    Local<Array> line = Local<Array>::Cast(a->Get(i));
    for (int j=0; j<n; ++j) {
      double x = line->Get(j)->NumberValue();
      d.push_back(x);
    }
    c.push_back(d);
  }

  c = solve(n, c, k);

  Local<Array> ret = Array::New(n);
  for (int i=0; i<n; ++i) {
    Local<Array> line = Array::New(n);
    for (int j=0; j<n; ++j) {
      line->Set(j, Number::New(c[i][j]));
    }
    ret->Set(i, line);
  }

  return scope.Close(ret);
}
