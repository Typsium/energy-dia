#import "modules.typ": *
#import "@preview/cetz:0.4.2"


#let ao(width: 5, height: 5, ..levels) = {
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
      draw_energy_level_ao(line, content, level.at("energy", default: 0), width, height, min, max, degeneracy: level.at("degeneracy", default: 1),caption: level.at("caption", default: none))

      draw_electron_ao(line, content, level.at("energy", default: 0), level.at("electrons", default: 0), width, height, min, max, up: level.at("up", default: none))
    }
  })
  }
}

#let mo(width: 5, height: 5, atom1: (), molecule: (), atom2: (), ..connections)={
  let all_levels = atom1 + molecule + atom2
  let min = find_min(all_levels)
  let max = find_max(all_levels)
  cetz.canvas({
    import cetz.draw: *

    draw_axis(line, content, width, height)
    
    let left_x = width / 6
    for level in atom1 {
      draw_energy_level_mo(line, content, level.at("energy", default: 0), left_x, width, height, min, max, degeneracy: level.at("degeneracy", default: 1), caption: level.at("caption", default: none))

      draw_electron_mo(line, content, level.at("energy", default: 0), level.at("electrons", default: 0), left_x, width, height, min, max, up: level.at("up", default: none))
    }
    

    let center_x = width / 2
    for level in molecule {
      draw_energy_level_mo(line, content, level.at("energy", default: 0), center_x, width, height, min, max, degeneracy: level.at("degeneracy", default: 1), caption: level.at("caption", default: none))

      draw_electron_mo(line, content, level.at("energy", default: 0), level.at("electrons", default: 0), center_x, width, height, min, max, up: level.at("up", default: none))
    }

    let right_x = 5 * width / 6
    for level in atom2 {
      draw_energy_level_mo(line, content, level.at("energy", default: 0), right_x, width, height, min, max, degeneracy: level.at("degeneracy", default: 1), caption: level.at("caption", default: none))

      draw_electron_mo(line, content, level.at("energy", default: 0), level.at("electrons", default: 0), right_x, width, height, min, max, up: level.at("up", default: none))
    }


    draw_connections(line, connections.pos(), atom1, molecule, atom2, width, height, min, max)
  })
}

#let band(width:5, height:5, include_energy_labels: false, ..levels) = {
  let levels_pos = levels.pos()
  let min = calc.min(..levels_pos)
  let max = calc.max(..levels_pos)
  cetz.canvas({
    import cetz.draw: *
    draw_axis(line, content, width, height)

    for level in levels_pos {
      draw_energy_level_band(line, content, level, width, height, min, max, include_energy_labels: include_energy_labels)
    }
  })
}