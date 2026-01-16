#import "@preview/lilaq:0.5.0" as lq
#let (time, Vs, Vo) = lq.load-txt(read("assets/4.4.2.Vs_C1.Vo_C2.txt"), delimiter: "\t", skip-rows: 1)

#let Ipd = Vo.map(x => 1e6 * ( -x / 1e6))

#show: lq.theme.skyline

#figure(caption: [Simulated LED current])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    xlabel: [*$I_(d p)$* [$mu$A]],
    ylabel: [*$V_(o)$* [V]],
    legend: (position: left + horizon),
    //ylim: (-2, 25.15),
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
      exponent: 0,
      // subticks: 4,
    ),

    lq.plot(Ipd, Vo, mark: ".", mark-size: 0pt), // label: [$V_(o u t)$]),
  )
]