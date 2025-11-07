#import "@preview/tidy:0.4.3"
#import "lib.typ": *

// Page settings
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm),
  header: align(center)[Energy-Dia Manual],
  footer: context align(center)[#counter(page).display("1")],
)

// Text settings
#set text(font: "New Computer Modern", size: 11pt)
#set heading(numbering: "1.")

// Introduction
= Introduction

Energy-Dia is a Typst library for creating energy diagrams such as atomic orbital diagrams, molecular orbital diagrams, and band structure diagrams. It utilizes the CeTZ library to easily draw diagrams for chemistry and physics.

== Features

- *Atomic Orbital Diagrams (AO)*: Visualize energy levels and electron configurations of atoms.
- *Molecular Orbital Diagrams (MO)*: Display molecular orbital formation and electron configurations.
- *Band Structure Diagrams*: Plot band structures.

== Installation

To use this library, add the following files to your Typst project:

- `lib.typ`
- `modules.typ`

Place these files in your project's root directory and import them in your document.

```typst
#import "lib.typ": *
```

#pagebreak()

// API Documentation
= API Documentation

The following sections document the functions provided by the Energy-Dia library.

#let docs = tidy.parse-module(read("lib.typ"))
#tidy.show-module(docs, style: tidy.styles.default)

#pagebreak()

// Examples
= Examples

This section provides examples of how to use the Energy-Dia library.

== Atomic Orbital Diagram

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

== Molecular Orbital Diagram

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

== Band Structure Diagram

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