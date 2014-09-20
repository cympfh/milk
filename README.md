Number and Matrix  
library  

implemented  
for Node.js  
written as C++ addon  

## TODO

Basic operations

https://github.com/cympfh/matrix-util/blob/master/test/test.coffee

## Notation

```haskell
module Number => Int where ...
newtype NumberList = Array(Number)
newtype Matrix = Array(Array(Number))
```

## Operations

```haskell
mat_add :: (Matrix, Matrix) -> Matrix
mat_mul :: (Matrix, Matrix) -> Matrix
```

行列のサイズは自分で責任を持つこと

```haskell
mat_scale :: (Number, Matrix) -> Matrix
```

スカラー倍

```haskell
shape :: Matrix -> [Int, Int]
reshape :: (Matrix, Int, Int) -> Matrix
```

```haskell
make_random :: (Int, Int) -> Matrix
```

`make_random n, m` は 各要素を `Math.random()` で生成した、n x m 行列を返す

