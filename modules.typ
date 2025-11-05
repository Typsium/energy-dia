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
  content_fn((0, height / 2), [energy/ eV], angle: 90deg, anchor: "south")
}

#let draw_energy_level(line_fn, content_fn, energy, width, height, min, max) = {
  let y= scale_y(energy, min, max, height)
  let x= position_x_ao(width)
  line_fn((x - width/7 ,y),(x + width/7,y))
  content_fn((width/5,y), [$energy$])
}

#let draw_electron(line_fn, content_fn, energy, number, width, height, min, max) = {
  let y= scale_y(energy, min, max, height)
  let x= position_x_ao(width)
  if number == 1{
    line_fn((x - width/20 ,y - height/20),(x - width/20,y + height/20), mark: (end:"straight"))
  }
  if number == 2{
    line_fn((x - width/20 ,y - height/20),(x - width/20,y + height/20), mark: (end:"straight"))
    line_fn((x + width/20 ,y - height/20),(x + width/20,y + height/20), mark: (end:"straight"))
  }
}

#let find_min(levels)={
  min = calc.min(levels.energy)
}
#let find_max(levels)={
  max = calc.max(levels.energy)
}
