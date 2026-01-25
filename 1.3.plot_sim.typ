

#import "@preview/lilaq:0.5.0" as lq
#let (vs, vafter, vbefore, i) = lq.load-txt(read("assets/4.3.1.txt"), delimiter: "\t", skip-rows: 1)

#let i = i.map(x => x * 1e3)

#let vdrop = vafter.zip(vbefore).map(vs => vs.at(1) - vs.at(0))

#let power = i.zip(vdrop).map(iv => iv.at(0) * iv.at(1))

#show: lq.theme.skyline

#figure(caption: [Simulated LED current])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    xlabel: [*$V_(s)$* [V]],
    ylabel: [*$I_(D)$* [mA]],
    legend: (position: left + horizon),
    ylim: (-2, 25.15),
    // xlim: (-520, 520),

    cycle: (
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%), thickness: .75pt, dash: "solid"))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%).transparentize(20%), thickness: 1.5pt, dash: "solid"))
        it
      },
    ),

    xaxis: (
      mirror: false,
      // exponent: 9,
      // subticks: 4,
    ),

    lq.plot(vs, i, mark: ".", mark-size: 0pt), // label: [$V_(o u t)$]),
  )
] <fig6>

#show: lq.theme.skyline

#figure(caption: [Simulated LED power])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    xlabel: [*$V_(s)$* [V]],
    ylabel: [*$P$* [mW]],
    legend: (position: left + horizon),
    // ylim: (-2, 25.15),
    // xlim: (-520, 520),

    cycle: (
      it => {
        set lq.style(stroke: (paint: red.darken(-20%), thickness: .75pt, dash: "solid"))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%).transparentize(20%), thickness: 1.5pt, dash: "solid"))
        it
      },
    ),

    xaxis: (
      mirror: false,
      // exponent: 9,
      // subticks: 4,
    ),

    lq.plot(vs, power, mark: ".", mark-size: 0pt), // label: [$V_(o u t)$]),
  )
] <fig7>
