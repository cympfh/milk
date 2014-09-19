Operation  
library  
for number and Matrix  

Implemention  
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

n x n の行列 A, B のついて、
`mul(A, B)` は A と B の積を返す
