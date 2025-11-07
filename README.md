# Energy-Dia

[日本語版](README.ja.md)

Energy-Dia is a Typst library for creating energy diagrams such as atomic orbital diagrams, molecular orbital diagrams, and band structure diagrams. It utilizes the CeTZ library to easily draw diagrams for chemistry and physics.

## Features

- **Atomic Orbital Diagrams (AO)**: Visualize energy levels and electron configurations of atoms.
- **Molecular Orbital Diagrams (MO)**: Display molecular orbital formation and electron configurations.
- **Band Structure Diagrams**: Plot band structures.

## Installation

To use this library, add the following files to your Typst project:

- `lib.typ`
- `modules.typ`

Place these files in your project's root directory and import them in your document.

```typst
#import "lib.typ": *
```

## Usage

### Atomic Orbital Diagram (AO)

Plots energy levels and electrons for atomic orbitals.

```typst
#ao(
  width: 10,
  height: 10,
  (energy: 4, electrons: 1, caption: "1s"),
  (energy: 5, electrons: 2, degeneracy: 2),
  (energy: 6, electrons: 4, degeneracy: 3, up: 3)
)
```

Parameters:
- `width`, `height`: Size of the diagram
- `energy`: Energy level
- `electrons`: Number of electrons
- `degeneracy`: Degeneracy (default: 1)
- `caption`: Label
- `up`: Number of up-spin electrons (optional); if not specified, alpha and beta spins are drawn alternately

### Molecular Orbital Diagram (MO)

Creates diagrams showing molecular orbital formation.

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

Parameters:
- `atom1`, `atom2`, `molecule`: Orbital data. Same as AO but as arrays. `label` is used to connect orbitals with dashed lines.
- Connections: Specify connections between orbitals. Connects orbitals specified by labels with dashed lines.

### Band Structure Diagram

Plots band structures.

```typst
#band(
  include_energy_labels: true,
  5, 6, 7
)
```

Or load data from a CSV file:

```typst
#let data = csv("test.csv")
#let energies = data.map(row => float(row.at(0))).flatten()
#band(
  include_energy_labels: false,
  ..energies
)
```

## Examples

See the `demo.typ` file for complete usage examples.

## Details

For detailed usage instructions, please refer to [manual.pdf](0.1.0/docs/manual.pdf).


## LICENSE

Apache License2.0 
Please check [LICENSE](LICENSE).