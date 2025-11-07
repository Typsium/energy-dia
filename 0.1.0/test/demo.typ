#import "../src/lib.typ": *

#ao(
  width: 10,
  height: 10,
  (energy:4, electrons:1, caption:"1s"),
  (energy:5, electrons:2, degeneracy:2),
  (energy:6, electrons:4, degeneracy:3, up:3)
)

#mo(
  width: 15,
  height: 10,
  atom1: ((energy: -10, electrons: 1, label: 1, caption: "1s"), (energy: -5, electrons: 4, degeneracy:2, up:2)),
  molecule: ((energy: -8, electrons: 2, label: 2), (energy: -3, electrons: 0, label: 3)),
  atom2: ((energy: -10, electrons: 1), (energy: -5, electrons: 1, label:4)),
  (1,2),(3,4), (2,4),
)

// bandテスト

#let data= csv("test.csv")
#let energies= data.map(row => float(row.at(0))).flatten()
#band(
  include_energy_labels:false,
  ..energies
)

#band(
  include_energy_labels:true,
  5,6,7, 15
)