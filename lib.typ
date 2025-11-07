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
  (energy:6, electrons:4, degeneracy:3, up:3)
)

#let mo(width: 5, height: 5, atom1: (), molecule: (), atom2: ())={
  let all_levels = atom1 + molecule + atom2
  let min = find_min(all_levels)
  let max = find_max(all_levels)
  cetz.canvas({
    import cetz.draw: *
    draw_axis(line, content, width, height)
    // Draw atom1 on the left
    let left_x = width / 6
    for level in atom1 {
      draw_energy_level_mo(line, content, level.at("energy", default: 0), left_x, width, height, min, max, degeneracy: level.at("degeneracy", default: 1))
      draw_electron_mo(line, content, level.at("energy", default: 0), level.at("electrons", default: 0), left_x, width, height, min, max, up: level.at("up", default: none))
    }
    // Draw molecule in the center
    let center_x = width / 2
    for level in molecule {
      draw_energy_level_mo(line, content, level.at("energy", default: 0), center_x, width, height, min, max, degeneracy: level.at("degeneracy", default: 1))
      draw_electron_mo(line, content, level.at("energy", default: 0), level.at("electrons", default: 0), center_x, width, height, min, max, up: level.at("up", default: none))
    }
    // Draw atom2 on the right
    let right_x = 5 * width / 6
    for level in atom2 {
      draw_energy_level_mo(line, content, level.at("energy", default: 0), right_x, width, height, min, max, degeneracy: level.at("degeneracy", default: 1))
      draw_electron_mo(line, content, level.at("energy", default: 0), level.at("electrons", default: 0), right_x, width, height, min, max, up: level.at("up", default: none))
    }
  })
}

#mo(
  width: 10,
  height: 10,
  atom1: ((energy: -10, electrons: 1), (energy: -5, electrons: 4, degeneracy:2, up:2)),
  molecule: ((energy: -8, electrons: 2), (energy: -3, electrons: 0)),
  atom2: ((energy: -10, electrons: 1), (energy: -5, electrons: 1))
)