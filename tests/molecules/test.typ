// [max-delta: 50]
/// [ppi: 70]
#import "../../src/lib.typ" : mo

#set page(width: auto, height: auto, margin: 0.5em)

#mo(
  width: 15,
  height: 12,
  names: ("O", $"O"_2$, "O"),
  exclude-energy: false,
  atom1: (
    (energy: -14, electrons: 2, label: 1, caption: "2s"),
    (energy: -5, electrons: 4, degeneracy: 3, up: 3, label: 2, caption: "2p"),
  ),
  molecule: (
    (energy: -16, electrons: 2, label: 3, caption: [$sigma_(2s)$]),
    (energy: -12, electrons: 2, label: 4, caption: [$sigma^*_(2s)$]),
    (energy: -8, electrons: 2, label: 5, caption: [$sigma_(2p)$]),
    (energy: -6, electrons: 4, degeneracy: 2, label: 7, caption: [$pi_(2p)$]),
    (energy: -4, electrons: 2, degeneracy: 2, up: 2, label: 8, caption: [$pi^*_(2p)$]),
    (energy: -2, electrons: 0, label: 6, caption: [$sigma^*_(2p)$]),
  ),
  atom2: (
    (energy: -14, electrons: 2, label: 9, caption: "2s"),
    (energy: -5, electrons: 4, degeneracy: 3, up: 3, label: 10, caption: "2p"),
  ),
  (1, 3), (1, 4), (2, 5), (2, 7), (2, 8), (2, 6),
  (9, 3), (9, 4), (10, 5), (10, 7), (10, 8), (10, 6)
)

#mo(
  width: 15,
  height: 12,
  names: ("F", $"F"_2$, "F"),
  atom1: (
    (energy: -18, electrons: 2, label: 1, caption: "2s"),
    (energy: -8, electrons: 5, degeneracy: 3, up: 3, label: 2, caption: "2p"),
  ),
  molecule: (
    (energy: -20, electrons: 2, label: 3, caption: [$sigma_(2s)$]),
    (energy: -16, electrons: 2, label: 4, caption: [$sigma^*_(2s)$]),
    (energy: -12, electrons: 2, label: 5, caption: [$sigma_(2p)$]),
    (energy: -10, electrons: 4, degeneracy: 2, label: 6, caption: [$pi_(2p)$]),
    (energy: -6, electrons: 4, degeneracy: 2, label: 7, caption: [$pi^*_(2p)$]),
    (energy: -4, electrons: 0, label: 8, caption: [$sigma^*_(2p)$]),
  ),
  atom2: (
    (energy: -18, electrons: 2, label: 9, caption: "2s"),
    (energy: -8, electrons: 5, degeneracy: 3, up: 3, label: 10, caption: "2p"),
  ),
  (1, 3), (1, 4), (2, 5), (2, 6), (2, 7), (2, 8),
  (9, 3), (9, 4), (10, 5), (10, 6), (10, 7), (10, 8)
)