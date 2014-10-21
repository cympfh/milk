*Number and Matrix*  
*library*  

*implemented*  
*for Node.js*  
*with C++ addon*  

# Usage
```bash
cd ~/node_modules/
git clone git@github.com:cympfh/milk.git
cd milk; make
```

# Notation

```haskell
module Number => Int where ...
newtype NumberList = Array(Number)
newtype Matrix = Array(Array(Number))
```

# Procedures

```haskell
mat_eq :: (Matrix, Matrix) -> Bool
-- mat_equal for alias
```

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


```haskell
mat_inv :: Matrix -> Matrix
```

逆行列を返す

まだ2x2行列しか実装してない
