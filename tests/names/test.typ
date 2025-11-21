/// [max-delta: 50]
/// [ppi: 100]
#import "../../src/lib.typ" : ao, mo

#set page(width: auto, height: auto, margin: 0.5em)

#ao(
  width: 8,
  height: 8,
  name: "C",
  (energy: -10, electrons: 2, caption: "1s"),
  (energy: -3, electrons: 2, caption: "2s"),
  (energy: -1, electrons: 2, degeneracy: 3, caption: "2p"),
)

#mo(
  width: 12,
  height: 8,
  names: ("H", $"H"_2$, "H"),
  atom1: ((energy: -5, electrons: 1, label: 1, caption: "1s"),),
  molecule: (
    (energy: -8, electrons: 2, label: 2, caption: [$sigma$]),
    (energy: -2, electrons: 0, label: 3, caption: [$sigma^*$]),
  ),
  atom2: ((energy: -5, electrons: 1, label: 4, caption: "1s"),),
  (1, 2), (1, 3), (4, 2), (4, 3)
)