# 行列演算を含む数値計算ライブラリ

## 参考

1. [math.js | an extensive math library for JavaScript and Node.js](http://mathjs.org/download.html)
1. [NumPy — Numpy](http://www.numpy.org/)

## 特長

新しくライブラリを整備するのに以下の2つを動機とします

node-gyp によってコンパイルされる C++ で記述されたアドオンとすることで  
高速なライブラリを目指します  
ただしほとんどの簡単な計算は返ってオーバーヘッドがあるので全てをアドオンにするわけではありません

行列はあくまでもJavaScriptが持つプリミティブなリスト型で定義し保有します  
`math.matrix` だとか `numpy.matrix` だとか新しいクラスを混在させないことを目標とします

### node-gyp について

node 0.11 以降、仕様が変わりました  
iojs の最新版を追います

## コンパイル

```bash
make gyp
make test
```

## 使い方

```
milk = require('milk')
```

# 詳細な説明

## 型のノーテーション

JavaScript 数値型を `Number` と書きます  
特に整数を `Int` と書きます  
`Number`のリストのリストを `Matrix` とします  
`Matrix` の全要素は長さの等しいリストであると仮定して動きます

## 関数

本ライブラリは以下の関数をエクスポートします  
Haskell風の表記を真似て `::` 右に型を示します

### 行列の等価性

```haskell
mat_eq :: (Matrix, Matrix) -> Bool
-- mat_equal for alias
```

### 行列の加減算

```haskell
mat_add :: (Matrix, Matrix) -> Matrix
mat_sub :: (Matrix, Matrix) -> Matrix
mat_mul :: (Matrix, Matrix) -> Matrix
```

それぞれ、行列2つの和差積を返す

```haskell
mat_neg :: Matrix -> Matrix
```

各要素をマイナスにした行列を返す

### スカラー倍

```haskell
mat_scale :: (Number, Matrix) -> Matrix
```

`mat_scale(k, A)` は 行列Aの各要素を k 倍したものを返す

### 行列の形状

```haskell
shape :: Matrix -> [Int, Int]
reshape :: (Matrix, Int, Int) -> Matrix
```

`shape` は行列が何行何列であるかを返す

## 単位行列

```haskell
eye :: Int -> Matrix
```

`eye(n)` は n次単位正方行列を返す

```
coffee> milk.reshape (milk.eye 3), 2, 4
[ [ 1, 0, 0, 0 ], [ 0, 0, 1, 0 ] ]
```

```haskell
make_random :: (Int, Int) -> Matrix
```

`make_random n, m` は 各要素を `Math.random()` で生成した、n x m 行列を返す

### 逆行列

```haskell
mat_inv :: Matrix -> Matrix
```

まだ2x2行列しか実装してない

### 対角行列

```haskell
diag :: [Number] -> Matrix
```

長さ n の数値のリストを対角成分とする n次正方行列を返す  
ここで 第(i, i)成分が第i引数に等しい


