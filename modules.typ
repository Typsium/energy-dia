#import "@preview/cetz:0.4.2"

#let scale_y(energy, min, max, height:5cm) = {
  let scaled_y = height * 0.95 * (energy - min) / (max - min)
  scaled_y
}

#let position_x_ao(width:5cm)={
  let pos_x = width / 2
  pos_x
}

#let draw_axis(line_fn, content_fn, width:5cm, height:5cm) = {
  line_fn((0, 0), (0, height), mark: (end: "straight"))
  content_fn((0, height / 2), [energy], angle: 90deg, anchor: "south")
}

#let draw_energy_level(line_fn, content_fn, energy, width:5cm, height:5cm) = {
  let y= scale_y()
}