#import "@preview/cetz:0.4.2"
#import "modules.typ": *

#cetz.canvas({
  import cetz.draw: *
  import "modules.typ": *
  line((1,1),(2,2))
  draw_axis(line, content)
})