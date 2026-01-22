
#import "@preview/lilaq:0.5.0" as lq
#let (freq, gain, phase) = lq.load-txt(read("assets/4.2.1.2k.txt"), delimiter: ",", skip-rows: 1)
#let (freq2, gain2, phase2) = lq.load-txt(read("assets/4.2.1.inf.txt"), delimiter: ",", skip-rows: 1)

#let freq = freq.map(x => x * 1e-3)
#let freq2 = freq2.map(x => x * 1e-3)

#show: lq.theme.skyline

#figure(
  caption: [Simulated phase and amplification of the non-inverting amplifier for a frequency of  5kHz-5MHz on a logarithmic scale. $R_1$= 2 k$Omega$],
)[
  #lq.diagram(
    width: 90%,
    height: 23%,
    // title: [],
    xlabel: [*Frequency* [kHz]],
    ylabel: [*Amplification* [dB]],
    // legend: (position: left + horizon, dx: -0pt, dy: -30pt, stroke: none),
    legend: (position: right + top, dx: -0pt, dy: -27pt, stroke: none),
    // xlim: (calc.pow(10, 3) * 4.5, calc.pow(10, 6) * 6),
    ylim: (-20, 31),
    xscale: lq.scale.log(),

    xaxis: (
      ticks: (
        (5, "5"),
        (10, "10"),
        (25, "25"),
        (50, "50"),
        (100, "100"),
        (250, "250"),
        (500, "500"),
        (1000, "1000"),
        (2500, "2500"),
        (5000, "5000"),
      ),
    ),

    yaxis: (
      mirror: false,
      exponent: 0,
      subticks: 4,
    ),

    cycle: (
      it => {
        set lq.style(fill: blue.darken(-20%).transparentize(0%), stroke: (thickness: 1pt))
        it
      },
      it => {
        set lq.style(fill: blue.darken(20%).transparentize(30%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
      it => {
        set lq.style(fill: red.darken(20%).transparentize(30%), stroke: (thickness: 1pt, dash: "dashed"))
        it
      },
      it => {
        set lq.style(fill: red.darken(-20%).transparentize(0%), stroke: (thickness: 1pt))
        it
      },
    ),


    lq.plot(freq, gain, mark: ".", label: [Amp. with $R_1$], mark-size: 0pt),

    lq.yaxis(
      position: right,
      label: [*Phase* [deg]],
      lq.plot(freq, phase, mark: ".", label: [Phase  with $R_1$], mark-size: 0pt),
      lq.plot(freq2, phase2, mark: ".", label: [Phase no $R_1$], mark-size: 0pt),
      lim: (-130, 200),
    ),

    lq.plot(freq2, gain2, mark: ".", label: [Amp. no $R_1$], mark-size: 0pt),
  )
] <fig2>


#let fg = freq.zip(gain)
#let x = fg.filter(x => calc.abs(x.at(1)) < 0.02)

#let num = 350
#let avg = gain.slice(0, num).sum() / num

// #avg
