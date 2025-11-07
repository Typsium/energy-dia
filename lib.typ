#import "modules.typ": *
#import "@preview/cetz:0.4.2"


#let ao(width: 5, height: 5, ..levels) = {
  // Draw atomic orbital energy level diagram
  // 
  // 5,
  // 5,
  // (energy:4, electrons:1), 
  // (energy:5, electrons:2), 
  // (energy:6, electrons:1)
  let min = find_min(levels.pos())
  let max = find_max(levels.pos())
  cetz.canvas({
  import cetz.draw: *

  draw_axis(line, content, width, height)
  for level in levels.pos() {
    draw_energy_level(line, content, level.energy, width, height, min, max, degeneracy: level.at("degeneracy", default: 1))
    draw_electron(line, content, level.energy, level.electrons, width, height, min, max)
  }
})
}


#ao(
  width: 10,
  height: 10,
  (energy:4, electrons:1),
  (energy:5, electrons:2, degeneracy:2),
  (energy:6, electrons:2)
)