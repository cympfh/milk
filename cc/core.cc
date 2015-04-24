#include <node.h>
#include <v8.h>
#include "mat_mul.h"
#include "mat_pow.h"

using namespace v8;

void init(Handle<Object> exports) {
  NODE_SET_METHOD(exports, "mat_mul", MatMul);
  NODE_SET_METHOD(exports, "mat_pow", MatPow);
}

NODE_MODULE(milk, init)
