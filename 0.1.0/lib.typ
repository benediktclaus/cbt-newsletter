#let light-blue = rgb("#D7E0F4")
#let bright-yellow = rgb("f7d748")
#let text-gray = rgb("#363636")

#let new-heading(title, introduction) = {
  block(
    {
      upper(heading(title))
      v(-0.9em)
      introduction
      v(1.4em)
    },
    sticky: true
  )
}


// Cite references in prose
#let cite-prose(ref-tag) = {
  cite(ref-tag, form: "prose")
}


// Single PICO bulletin point
#let pico-bulletin(size: 1cm, letter) = {
  rect(
    height: size,
    width: size,
    fill: bright-yellow,
    radius: 100%,
    align(horizon + center, text(fill: white, weight: "black", letter)),
  )
}


// Formatted PICO table
#let pico(
  population: none,
  intervention: none,
  comparison: none,
  outcome: none,
) = {
  grid(
    columns: 2,
    column-gutter: 1em,
    row-gutter: 1em,
    inset: (x, _) => if x == 1 { (top: 3mm) } else { 0mm },
    pico-bulletin("P"), population,
    pico-bulletin("I"), intervention,
    pico-bulletin("C"), comparison,
    pico-bulletin("O"), outcome,
  )
}

// Person of the month
#let person-of-the-month(name: none, picture: none, quote: none) = {
  align(center, block(
    fill: light-blue,
    height: 7cm,
    width: 90%,
    grid(
      columns: 2,
      align: horizon + center,
      inset: (x, _) => if x == 0 { (left: 10mm, right: 10mm) } else { 0mm },
      [
        #text(style: "italic", quote)

        #align(right)[--- #name]
      ],
      picture,
    ),
  ))
}


#let newsletter(
  date: none,
  welcome: none,
  intro: none,
  intro-image: none,
  intro-height: 7cm,
  body,
) = [
  // Page setup
  #set text(
    font: "Montserrat",
    lang: "de",
    size: 11pt,
    fill: text-gray,
  )
  #set par(justify: true)
  #set list(marker: text(sym.circle.filled, fill: bright-yellow))


  // Format headings
  #show heading.where(level: 1): it => {
    set text(size: 16pt)

    v(1em)
    align(
      left,
      box(
        width: 100%,
        [
          #line(length: 100%, stroke: 3pt + bright-yellow)
          #v(0.6em)
          #upper(it.body)
        ],
      ),
    )
  }

  #show heading.where(level: 2): it => {
    set text(size: 11pt)
    upper(it.body)
  }

  #set page(
    margin: (y: 1cm, x: 2cm),
    background: context {
      // Get current page number
      let current-page = counter(page).get().at(0)

      // Place page number
      place(
        box(
          align(
            center,
            text(weight: "bold", counter(page).display("1/1", both: true), fill: white),
          ),
          width: 1.4cm,
          height: 1cm,
          fill: bright-yellow,
        ),
        right + horizon,
      )


      if current-page == 1 {
        // Blue color block in background
        align(
          top + left,
          block(width: 100%, height: 7cm, fill: light-blue),
        )

        // Clinic logo
        place(
          top + right,
          block(
            height: 5cm,
            width: 4cm,
            // fill: white,
            place(image("images/logo.png"), dy: 50%),
          ),
          dx: -2cm,
        )
      } else if counter(page).final().at(0) == current-page {
        place(
          block(
            width: 100%,
            height: 4cm,
            fill: light-blue,
          ),
          bottom,
        )
      }
    },
  )

  // Newsletter title
  #block(height: 5cm)[
    #set text(size: 24pt)
    #set align(horizon)
    #grid(
      columns: 1,
      row-gutter: 1em,
      text("CBT & PSYCHOTHERAPY"),
      [#text("INSIGHTS", weight: "extrabold")],
    )
  ]


  // Date block
  #block(
    width: 6cm,
    height: 1cm,
    fill: rgb("f7d748"),
    radius: 100%,
    align(
      horizon + center,
      text(size: 16pt, weight: "semibold", date, fill: white),
    ),
  )

  #v(1fr)
  #align(center, welcome)
  #v(1fr)

  #block(
    height: intro-height,
    grid(
      columns: 2,
      column-gutter: 2em,
      intro, intro-image,
    ),
  )

  #v(1fr)
  #outline(target: heading.where(level: 1))
  #v(1fr)

  #pagebreak()
  #body

  // #pagebreak()
  #bibliography("references.bib", title: "Literatur", style: "apa")
]
