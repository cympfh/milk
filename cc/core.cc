#include <node.h>
#include <v8.h>
#include "mat_mul.h"
#include "mat_pow.h"

using namespace v8;

void init(Handle<Object> exports) {
  exports->Set(String::NewSymbol("mat_mul"),
      FunctionTemplate::New(MatMul)->GetFunction());
  exports->Set(String::NewSymbol("mat_pow"),
      FunctionTemplate::New(MatPow)->GetFunction());
}

NODE_MODULE(milk, init)
