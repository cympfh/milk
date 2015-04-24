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

数値型を `Number` とします  
整数であるとか不動小数であるとかは気にしません  
ただし複素数をネイティブに扱うつもりはありません

`Number`のリストのリストを `Matrix` とします  
`Matrix` の全要素は長さの等しいリストであると仮定して動きます

## 関数

本ライブラリは以下の関数をエクスポートします  
Haskell風の表記を真似て `::` 右に型を示します

```haskell
mat_eq :: (Matrix, Matrix) -> Bool
-- mat_equal for alias
```

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
