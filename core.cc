#include <node.h>
#include <v8.h>
#include "./mul.h"

using namespace v8;

void init(Handle<Object> exports) {
  exports->Set(String::NewSymbol("mul"),
      FunctionTemplate::New(Mul)->GetFunction());
}

NODE_MODULE(milk, init)
