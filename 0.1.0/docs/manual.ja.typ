#import "@preview/tidy:0.4.3"
#import "../src/lib.typ": *

// ページ設定
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  header: align(center)[Energy-Dia マニュアル],
  footer: context align(center)[#counter(page).display("1")],
)

// テキスト設定
#set text(font: ("Times New Roman", "YuMincho"), size: 11pt, lang: "ja")
#set heading(numbering: "1.")

// 導入
= 導入

Energy-Dia は、原子軌道図、分子軌道図、バンド構造図などのエネルギー図を作成するための Typst ライブラリです。CeTZ ライブラリを利用して、化学や物理の図を簡単に描画します。

== 機能

- *原子軌道図 (AO)*: 原子のエネルギー準位と電子配置を視覚化します。
- *分子軌道図 (MO)*: 分子軌道の形成と電子配置を表示します。
- *バンド構造図*: バンド構造をプロットします。

== インストール

このライブラリを使用するには、以下のファイルを Typst プロジェクトに追加してください：

- `lib.typ`
- `modules.typ`

これらのファイルをプロジェクトのルートディレクトリに置き、ドキュメントでインポートしてください。

```typst
#import "lib.typ": *
```

#pagebreak()

// API ドキュメント
= API ドキュメント

以下のセクションでは、Energy-Dia ライブラリが提供する関数を文書化します。

#let docs = tidy.parse-module(read("../src/lib.typ"))
#tidy.show-module(docs, style: tidy.styles.default)

#pagebreak()

// 例
= 例

このセクションでは、Energy-Dia ライブラリの使用例を提供します。

== 原子軌道図

```typst
#ao(
  width: 10,
  height: 10,
  (energy: 4, electrons: 1, caption: "1s"),
  (energy: 5, electrons: 2, degeneracy: 2),
  (energy: 6, electrons: 4, degeneracy: 3, up: 3)
)
```

#ao(
  width: 10,
  height: 10,
  (energy: 4, electrons: 1, caption: "1s"),
  (energy: 5, electrons: 2, degeneracy: 2),
  (energy: 6, electrons: 4, degeneracy: 3, up: 3)
)

== 分子軌道図

```typst
#mo(
  width: 15,
  height: 10,
  atom1: ((energy: -10, electrons: 1, label: 1, caption: "1s"), (energy: -5, electrons: 4, degeneracy: 2, up: 2)),
  molecule: ((energy: -8, electrons: 2, label: 2), (energy: -3, electrons: 0, label: 3)),
  atom2: ((energy: -10, electrons: 1), (energy: -5, electrons: 1, label: 4)),
  (1, 2), (3, 4), (2, 4)
)
```

#mo(
  width: 15,
  height: 10,
  atom1: ((energy: -10, electrons: 1, label: 1, caption: "1s"), (energy: -5, electrons: 4, degeneracy: 2, up: 2)),
  molecule: ((energy: -8, electrons: 2, label: 2), (energy: -3, electrons: 0, label: 3)),
  atom2: ((energy: -10, electrons: 1), (energy: -5, electrons: 1, label: 4)),
  (1, 2), (3, 4), (2, 4)
)

== バンド構造図

```typst
#band(
  include_energy_labels: true,
  5, 6, 7, 15
)
```

#band(
  include_energy_labels: true,
  5, 6, 7, 15
)