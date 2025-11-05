#import "@preview/cetz:0.4.2"
#import "modules.typ": *

#let width = 5
#let height =5
#let min =3
#let max =8

#let draw(width, height, level, min, max)={
cetz.canvas({
  import cetz.draw: *
  import "modules.typ": *

  draw_axis(line, content, width, height)
  draw_energy_level(line, content, level.energy, width, height, min, max)
  draw_electron(line, content, level.energy, level.electrons, width, height, min, max)
})
}