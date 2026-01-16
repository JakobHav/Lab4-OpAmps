


#import "@preview/lilaq:0.5.0" as lq
// #let (t, vbefore, vafter) = lq.load-txt(read("assets/4.3.2.voldrop.txt"), delimiter: "\t", skip-rows: 1)
#let (t, vs, vafter) = lq.load-txt(read("assets/4.3.2.Vs_C1.V1_C2.txt"), delimiter: "\t", skip-rows: 1)
#let (t2, vs2, vbefore) = lq.load-txt(read("assets/4.3.2.Vs_C1.V3_C2.txt"), delimiter: "\t", skip-rows: 1)

#let t2 = t2.map(t => t + 0.465)


// #panic(vs.zip(t).find(x => calc.abs(x.at(0) + 8.98) < 0.01))

#let new_t = ()
#let new_vs = ()
#let new_vafter = ()

#for ((t, vss), v) in t.zip(vs).zip(vafter) {
  if t > -0.052 and t < 0.44726 {
    new_t.push(t)
    new_vs.push(vss)
    new_vafter.push(v)
  }
}

#let new_vbefore = ()

#for ((t, vss), v) in t2.zip(vs2).zip(vbefore) {
  if t > -0.052 and t < 0.44726 {
    new_vbefore.push(v)
  }
}

#let i = new_vafter.map(x => 1000 * x / 470)

#let vdrop = new_vafter.zip(new_vbefore).map(vs => vs.at(1) - vs.at(0))

#let power = i.zip(vdrop).map(iv => iv.at(0) * iv.at(1))

#show: lq.theme.skyline

#show: lq.set-grid(
  stroke: black.transparentize(75%) + 0.25pt,
  stroke-sub: 0.1pt,
  sub: true,
)


#figure(caption: [Measured LED current])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    xlabel: [*$V_(s)$* [V]],
    ylabel: [*$I_(D)$* [mA]],
    legend: (position: left + horizon),
    // ylim: (-2, 25.15),
    // xlim: (-520, 520),

    cycle: (
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%), thickness: .75pt, dash: "solid"))
        it
      },
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

    lq.plot(new_vs, i, mark: ".", mark-size: 0pt), // label: [$V_(o u t)$]),
  )
]

#show: lq.theme.skyline

#show: lq.set-grid(
  stroke: black.transparentize(75%) + 0.25pt,
  stroke-sub: 0.1pt,
  sub: true,
)


#figure(caption: [Measured LED power])[
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

    lq.plot(new_vs, power, mark: ".", mark-size: 0pt), // label: [$V_(o u t)$]),
  )
]
