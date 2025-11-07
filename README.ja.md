# Energy-Dia

[English version](README.md)

Energy-Diaは、Typstでエネルギー図（原子軌道図、分子軌道図、バンド構造図）を作成するためのライブラリです。CeTZライブラリを使用して、化学や物理学の図を簡単に描画できます。

## 特徴

- **原子軌道図 (AO)**: 原子の軌道エネルギーと電子配置を視覚化
- **分子軌道図 (MO)**: 分子軌道の形成と電子配置を表示
- **バンド構造図**: バンド構造をプロット

## インストール

このライブラリを使用するには、Typstプロジェクトに以下のファイルを追加してください：

- `lib.typ`
- `modules.typ`

プロジェクトのルートディレクトリにこれらのファイルを配置し、ドキュメント内でインポートします。

```typst
#import "lib.typ": *
```

## 使用方法

### 原子軌道図 (AO)

原子軌道のエネルギーレベルと電子をプロットします。

```typst
#ao(
  width: 10,
  height: 10,
  (energy: 4, electrons: 1, caption: "1s"),
  (energy: 5, electrons: 2, degeneracy: 2),
  (energy: 6, electrons: 4, degeneracy: 3, up: 3)
)
```

パラメータ:
- `width`, `height`: 図のサイズ
- `energy`: エネルギーレベル
- `electrons`: 電子数
- `degeneracy`: 縮退度（デフォルト: 1）
- `caption`: ラベル
- `up`: 上向きスピンの電子数（オプション）値が指定されていない場合はalphaスピンとbetaスピンが交互に描画

### 分子軌道図 (MO)

分子軌道の形成を示す図を作成します。

```typst
#mo(
  width: 15,
  height: 10,
  atom1: ((energy: -10, electrons: 1, label: 1, caption: "1s"), (energy: -5, electrons: 4, degeneracy: 2, up: 2)),
  molecule: ((energy: -8, electrons: 2, label: 2), (energy: -3, electrons: 0, label: 3)),
  atom2: ((energy: -10, electrons: 1), (energy: -5, electrons: 1, label: 4)),
  (1,2), (3,4), (2,4)
)
```

パラメータ:
- `atom1`, `atom2`, `molecule`: 軌道データ。label以外はAOと同じものの多重配列。labelは軌道管を点線でつなぐために使う。
- 接続: 軌道間の接続を指定。labelで指定された軌道同士を点線でつなぐ

### バンド構造図

バンド構造をプロットします。

```typst
#band(
  include_energy_labels: true,
  5, 6, 7
)
```

またはCSVファイルからデータを読み込み:

```typst
#let data = csv("test.csv")
#let energies = data.map(row => float(row.at(0))).flatten()
#band(
  include_energy_labels: false,
  ..energies
)
```

## 詳細

詳細な使用方法は[manual.pdf](0.1.0/docs/manual.pdf)を確認してください。