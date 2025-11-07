#let scale_y(energy, min, max, height) = {
  if max == min {
    height * 0.95 / 2
  } else {
    let scaled_y = height * 0.95 * (energy - min) / (max - min)
    scaled_y
  }
}

#let position_x_ao(width)={
  let pos_x = width / 2
  pos_x
}

#let draw_axis(line_fn, content_fn, width, height) = {
  line_fn((0, 0), (0, height), mark: (end: "straight"))
  content_fn((0, height / 2), [energy / eV], angle: 90deg, anchor: "south")
}

#let draw_energy_level(line_fn, content_fn, energy, width, height, min, max, degeneracy: 1) = {
  let y= scale_y(energy, min, max, height)
  let x= position_x_ao(width)
  let line_length = width / 7
  let spacing = height / 50
  for i in range(degeneracy) {
    let offset = (i - (degeneracy - 1) / 2) * spacing
    line_fn((x - line_length, y + offset),(x + line_length, y + offset))
  }
  content_fn((width/5,y), [$energy$])
}

#let draw_electron(line_fn, content_fn, energy, number, width, height, min, max, up: none) = {
  if number <= 0 {
    // No electrons to draw
  } else {
    let y = scale_y(energy, min, max, height)
    let x_center = position_x_ao(width)
    let left = x_center - width / 7
    let right = x_center + width / 7
    let spacing = (right - left) / (number + 1)
    if up == none {
      // Default behavior: alternate up and down
      for i in range(number) {
        let x = left + (i + 1) * spacing
        let is_up = calc.rem(i, 2) == 0
        if is_up {
          line_fn((x, y + height/20), (x, y - height/20), mark: (end: "straight"))
        } else {
          line_fn((x, y - height/20), (x, y + height/20), mark: (end: "straight"))
        }
      }
    } else {
      // Specified up count: up arrows up, then down
      let up_count = calc.min(up, number)
      let down_count = number - up_count
      let current_x = left + spacing
      for i in range(up_count) {
        line_fn((current_x, y + height/20), (current_x, y - height/20), mark: (end: "straight"))
        current_x += spacing
      }
      for i in range(down_count) {
        line_fn((current_x, y - height/20), (current_x, y + height/20), mark: (end: "straight"))
        current_x += spacing
      }
    }
  }
}

#let find_min(levels)={
  if levels.len() == 0 {
    0
  } else {
    let energies = levels.map(it => it.energy)
    calc.min(..energies)
  }
}
#let find_max(levels)={
  if levels.len() == 0 {
    0
  } else {
    let energies = levels.map(it => it.energy)
    calc.max(..energies)
  }
}
