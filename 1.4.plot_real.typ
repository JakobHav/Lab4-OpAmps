#import "@preview/lilaq:0.5.0" as lq
#let (time, Vs, Vo) = lq.load-txt(read("assets/4.4.2.Vs_C1.Vo_C2.txt"), delimiter: "\t", skip-rows: 1)

#let Ipd = Vo.map(x => 1e6 * ( -x / 1e6))

#show: lq.theme.skyline

#figure(caption: [Measured transimpedance amplifier])[
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

#figure(caption: [Measured transimpedance amplifier over $V_s$])[
  #lq.diagram(
    width: 80%,
    height: 21%,
    xlabel: [*$V_(s)$* [V]],
    ylabel: [*$V_(o u t)$* [V]],
    legend: (position: left + horizon),
    // ylim: (-0.001, 5.15),
    //xlim: (-520, 520),

    cycle: (
      it => {
        set lq.style(stroke: (paint: blue.darken(-20%).transparentize(30%), thickness: 1.5pt, dash: "solid"))
        it
      },
      it => {
        set lq.style(stroke: (paint: red.darken(-0%), thickness: .75pt, dash: "dashed"))
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
      label: [*$abs(I_(d p))$* [$mu$ A]],
      lq.plot(Vs, Ipd.map(x => calc.abs(x)), mark: ".", mark-size: 0pt, label: [_$abs(I_(d p))$_]),
      //im: (-14231960, 0),
    ),
    
    lq.plot(Vs, Vo, mark: ".", mark-size: 0pt, label: [$V_(o u t)$]),

    
  )
]