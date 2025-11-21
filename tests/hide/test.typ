/// [max-delta: 50]
/// [ppi: 100]
#import "../../src/lib.typ" : ao

#set page(width: auto, height: auto, margin: 0.5em)

#ao(
  width: 8,
  height: 8,
  name: "N",
  exclude-energy: true,
  (energy: -14, electrons: 2, caption: "1s"),
  (energy: -3, electrons: 2, caption: "2s"),
  (energy: -1, electrons: 3, degeneracy: 3, up: 3, caption: "2p"),
)