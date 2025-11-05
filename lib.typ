#import "modules.typ": *
#import "@preview/cetz:0.4.2"


#let ao(width, height, ..levels) = {
  // Draw atomic orbital energy level diagram
  // width:5
  // height:5
  // levels: (energy:4, electrons:1), (energy:5, electrons:2), (energy:6, electrons:1)
  find_min(levels)
  find_max(levels)
  let max =8
  cetz.canvas({
  import cetz.draw: *

  draw_axis(line, content, width, height)
  for level in levels.pos() {
    draw_energy_level(line, content, level.energy, width, height, min, max)
    draw_electron(line, content, level.energy, level.electrons, width, height, min, max)
  }
})
}


#ao(
  5,
  5,
  (energy:4, electrons:1),
  (energy:5, electrons:2),
  (energy:6, electrons:1)
)