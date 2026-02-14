#let callout(title, body, color: rgb("#1f4b99"), background: rgb("#eef4ff")) = block(
  inset: 10pt,
  stroke: 1pt + color,
  fill: background,
  radius: 6pt,
  breakable: true,
)[
  #text(weight: "bold", fill: color)[#title:]
  #body
]

#let note(body) = callout(
  [Note],
  body,
  color: rgb("#1f4b99"),
  background: rgb("#eef4ff"),
)

#let warn(body) = callout(
  [Warning],
  body,
  color: rgb("#9a3d00"),
  background: rgb("#fff3e8"),
)

#let tip(body) = callout(
  [Tip],
  body,
  color: rgb("#0b6a42"),
  background: rgb("#ebfff4"),
)
