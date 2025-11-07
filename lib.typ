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
  let pos_levels = levels.pos()
  if pos_levels.len() == 0 {
    cetz.canvas({
      import cetz.draw: *
      draw_axis(line, content, width, height)
    })
  } else {
    let min = find_min(pos_levels)
    let max = find_max(pos_levels)
    cetz.canvas({
    import cetz.draw: *
    draw_axis(line, content, width, height)
    for level in pos_levels {
      draw_energy_level(line, content, level.at("energy", default: 0), width, height, min, max, degeneracy: level.at("degeneracy", default: 1))
      draw_electron(line, content, level.at("energy", default: 0), level.at("electrons", default: 0), width, height, min, max, up: level.at("up", default: none))
    }
  })
  }
}


#ao(
  width: 10,
  height: 10,
  (energy:4, electrons:1),
  (energy:5, electrons:2, degeneracy:2),
  (energy:6, electrons:1)
)

// Example with spin orientation
#ao(
  width: 10,
  height: 10,
  (energy:4, electrons:1, up: 1),
  (energy:5, electrons:4, up: 1),
  (energy:6, electrons:1, up: 0)
)