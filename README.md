Number and Matrix  
library  

implemented  
for Node.js  
written as C++ addon  

## TODO

Basic operations

https://github.com/cympfh/matrix-util/blob/master/test/test.coffee

# implemented operation

## Notation

```haskell
module Number => Int where ...
newtype NumberList = Array(Number)
newtype Matrix = Array(Array(Number))
```

## List

```haskell
mul :: (Matrix, Matrix) -> Matrix
```

行列 `A`, `B` について、
`mul(A, B)` は その積を返す．

```haskell
let (n, m) = shape A
    (l, k) = shape B
in m == l
```

