#import "modules.typ": *
#import "ao.typ": *

#let ao(width, height, ..levels) = {
  // Draw atomic orbital energy level diagram
  // width:5
  // height:5
  // levels: (energy:4, electrons:1), (energy:5, electrons:2), (energy:6, electrons:1)
  let min = find_min(levels)
  let max = find_max(levels)
  for level in levels {
    draw(width, height, level, min, max)
  }
}

#ao(
  width:5,
  height:5,
  (energy:4, electrons:1),
  (energy:5, electrons:2),
  (energy:6, electrons:1)
)