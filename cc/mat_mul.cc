#include <node.h>
#include <v8.h>
#include "mat_mul.h"

using namespace v8;

void MatMul(const FunctionCallbackInfo<Value>& args) {
  Isolate* isolate = Isolate::GetCurrent();
  HandleScope scope(isolate);

  // type check of args
  if ( !args[0]->IsArray()
    || !args[1]->IsArray()) {
    Local<String> msg = String::NewFromUtf8(isolate, "mat_mul :: (Matrix, Matrix) -> Matrix");
    isolate->ThrowException(Exception::TypeError(msg));
    return;
  }

  // cast args
  Local<Array> xs0 = Local<Array>::Cast(args[0]);
  Local<Array> ys0 = Local<Array>::Cast(args[1]);
  int n = xs0->Length();
  int m = ys0->Length();
  int l = Local<Array>::Cast(ys0->Get(0))->Length();

  double xs[n][m];
  double ys[m][l];

  for (int i=0; i<n; ++i) {
    for (int j=0; j<m; ++j) {
      xs[i][j] = Local<Array>::Cast(xs0->Get(i))->Get(j)->NumberValue();
    }
  }
  for (int i=0; i<m; ++i) {
    for (int j=0; j<l; ++j) {
      ys[i][j] = Local<Array>::Cast(ys0->Get(i))->Get(j)->NumberValue();
    }
  }

  Local<Array> ret = Array::New(isolate, n);

  for (int i=0; i<n; ++i) {
    Local<Array> line = Array::New(isolate, l);
    for (int j=0; j<l; ++j) {
      double sum = 0;
      for (int k=0; k<m; ++k) {
        sum += xs[i][k] * ys[k][j];
      }
      line->Set(j, Number::New(isolate, sum));
    }
    ret->Set(i, line);
  }
  args.GetReturnValue().Set(ret);
}
