/// [max-delta: 50]
/// [ppi: 100]
#import "../../src/lib.typ" : ao

#set page(width: auto, height: auto, margin: 0.5em)

#ao(
  width: 8,
  height: 6,
  (energy: -10, electrons: 2, caption: "1s"),
  (energy: -5, electrons: 3, degeneracy: 3, caption: "2p"),
)