Number and Matrix  
library  

implemented  
for Node.js  
written as C++ addon  

## Notation

```haskell
module Number => Int where ...
newtype NumberList = Array(Number)
newtype Matrix = Array(Array(Number))
```

## Procedures

```haskell
mat_add :: (Matrix, Matrix) -> Matrix
mat_sub :: (Matrix, Matrix) -> Matrix
mat_mul :: (Matrix, Matrix) -> Matrix -- 行列サイズに註意
```

それぞれ、行列2つの和差積を返す

```haskell
mat_neg :: Matrix -> Matrix
```

各要素をマイナスにした行列を返す

```haskell
mat_scale :: (Number, Matrix) -> Matrix
```

`mat_scale(k, A)` は 行列Aの各要素を k 倍したものを返す

```haskell
shape :: Matrix -> [Int, Int]
reshape :: (Matrix, Int, Int) -> Matrix
```

```haskell
make_random :: (Int, Int) -> Matrix
```

`make_random n, m` は 各要素を `Math.random()` で生成した、n x m 行列を返す

