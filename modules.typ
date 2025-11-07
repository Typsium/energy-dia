#let scale_y(energy, min, max, height) = {
  let scaled_y = height * 0.95 * (energy - min) / (max - min)
  scaled_y
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
  let spacing = height / 50  // レスポンシブな間隔
  for i in range(degeneracy) {
    let offset = (i - (degeneracy - 1) / 2) * spacing
    line_fn((x - line_length, y + offset),(x + line_length, y + offset))
  }
  content_fn((width/5,y), [$energy$])
}

#let draw_electron(line_fn, content_fn, energy, number, width, height, min, max) = {
  let y = scale_y(energy, min, max, height)
  let x_center = position_x_ao(width)
  let left = x_center - width / 7
  let right = x_center + width / 7
  let spacing = (right - left) / (number + 1)
  for i in range(number) {
    let x = left + (i + 1) * spacing
    line_fn((x ,y - height/20),(x,y + height/20), mark: (end:"straight"))
  }
}

#let find_min(levels)={
  let energies = levels.map(it => it.energy)
  calc.min(..energies)
}
#let find_max(levels)={
  let energies = levels.map(it => it.energy)
  calc.max(..energies)
}
