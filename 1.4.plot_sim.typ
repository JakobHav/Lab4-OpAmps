
#import "@preview/lilaq:0.5.0" as lq
#let (id, vout) = lq.load-txt(read("assets/4.4.1.ipd.txt"), delimiter: "\t", skip-rows: 1)

#let id = id.map(x => x * 1e9)

#let transimpedance = id.zip(vout).map(x => 1e9 * x.at(1) / x.at(0))

#show: lq.theme.skyline

#figure(caption: [Simulated transimpedance amplifier])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    xlabel: [*$I_(p d)$* [nA]],
    ylabel: [*$V_(o u t)$* [V]],
    legend: (position: left + horizon),
    // ylim: (-0.001, 5.15),
    xlim: (-520, 520),

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
      exponent: 0,
      // subticks: 4,
    ),

    lq.yaxis(
      position: right,
      label: [*transimpedance factor*],
      lq.plot(id, transimpedance, mark: ".", mark-size: 0pt, label: [_t. factor_]),
      lim: (-15666660, 0),
    ),
    lq.plot(id, vout, mark: ".", mark-size: 0pt, label: [$V_(o u t)$]),
  )
]
