#import "@preview/theorion:0.3.2": *

#let title = "AAC Note"
#let author = "isomo"
#let date = datetime.today()

#let primary-color = rgb("#034c48")
#let secondary-color = rgb("#113f64")
#let accent-color = rgb("#d01238")
#let text-color = rgb("#172a2a")

#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 2.5cm, top: 3cm, bottom: 3cm),
  number-align: center,
  header: context {
    if counter(page).get().first() > 1 {
      align(center, line(length: 100%, stroke: 0.5pt + gray))
      v(-0.75em)
      align(center, text(size: 10pt, fill: gray, title))
    }
  },
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  fill: text-color,
  lang: "en",
)

#set par(
  justify: true,
  leading: 0.65em,
  spacing: 1.2em,
)

#let chapter-zero-numbering(..nums) = {
  let ns = nums.pos()
  if ns.len() == 0 {
    return
  }

  let first = ns.first() - 1
  numbering("1.1.1", first, ..ns.slice(1))
}

#set heading(numbering: chapter-zero-numbering)

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(2em)
  block[
    #set align(center)
    #set text(size: 20pt, weight: "bold", fill: primary-color)
    #if it.numbering != none [
      #counter(heading).display(it.numbering)
      #h(1em)
    ]
    #upper(it.body)
    #v(1em)
    #line(length: 60%, stroke: 2pt + primary-color)
  ]
  v(1.5em)
}

#show heading.where(level: 2): it => {
  v(1.5em)
  block[
    #set text(size: 16pt, weight: "bold", fill: secondary-color)
    #if it.numbering != none [
      #counter(heading).display(it.numbering)
      #h(1em)
    ]
    #it.body
    #v(0.5em)
    #line(length: 100%, stroke: 1pt + secondary-color)
  ]
  v(1em)
}

#show heading.where(level: 3): it => {
  v(1em)
  block[
    #set text(size: 14pt, weight: "bold", fill: text-color)
    #if it.numbering != none [
      #counter(heading).display(it.numbering)
      #h(1em)
    ]
    #it.body
  ]
  v(0.75em)
}

#show: show-theorion
#set math.equation(numbering: none)

#let redt(content) = text(fill: rgb("#DC143C"), content)
#let bluet(content) = text(fill: rgb("#1E90FF"), content)
#let greent(content) = text(fill: rgb("#32CD32"), content)

#align(center)[
  #v(2cm)
  #text(size: 24pt, weight: "bold", fill: primary-color)[
    #upper(title)
  ]
  #v(1cm)
  #text(size: 14pt, fill: secondary-color)[
    Algebra Abstract and Concrete Notes
  ]
  #v(2cm)
  #text(size: 12pt)[
    *Author:* #author \
    *Date:* #date.display("[month repr:long] [day], [year]")
  ]
  #v(1cm)
  #line(length: 50%, stroke: 1pt + primary-color)
]

#pagebreak()

#outline(
  title: [Table of Contents],
  indent: auto,
)

#pagebreak()

#set page(numbering: "1", number-align: center)
#counter(page).update(1)

#include "chapters/preface.typ"
#include "chapters/01-algebraic.typ"
