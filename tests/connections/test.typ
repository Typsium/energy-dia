/// [max-delta: 50]
/// [ppi: 100]
#import "../../src/lib.typ" : mo

#set page(width: auto, height: auto, margin: 0.5em)

#mo(
  width: 12,
  height: 8,
  atom1: ((energy: -5, electrons: 1, label: 1),),
  molecule: (
    (energy: -8, electrons: 2, label: 2),
    (energy: -2, electrons: 0, label: 3),
  ),
  atom2: ((energy: -5, electrons: 1, label: 4),),
  (1, 2), (1, 3), (4, 2), (4, 3)
)