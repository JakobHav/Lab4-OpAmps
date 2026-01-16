#import "@preview/lilaq:0.5.0" as lq

#set page(background: image("assets/frontpage.jpg"))
#v(209pt)
#h(105pt)
Jakob Haverkamp
#h(155pt)
5932110

#h(105pt)
Milan Fark
#h(186pt)
5900383

#set page(background: [])

#import "@local/ufr-sheet-universal:0.1.0": conf

#show: doc => conf(
  doc,
  subject: "Electronics Laboratory",
  date: "11.01.2025",
  prof: "Prof. Dr. Hans Zappe",
  semester: "WS 25/26",
  title: "Lab 4 - MOSFETs",
  header_start: 2,
  name: "jh1444, mf643",
  left_header: [Jakob Haverkamp \ Milan Fark \ jh1444, #h(5pt)mf643],
)
#counter(page).update(1)
#set text(
  lang: "en",
  size: 11pt,
)

#set figure(numbering: "1")
#show ref: set text(fill: blue)


= 4.2 Non-inverting amplifier

== 4.2.1 Simulation

=== Introduction

In this section, we simulated a non-inverting amplifier circuit shown in @4.3.1.circuit.

=== Circuit Diagrams:

#figure(caption: [LTSpice _non-inverting amplifier_ circuit diagram#footnote[We changed `AC 5` to `AC 1` (so )]])[
  #image("assets/4.2.1.circuit.jpg", width: 50%)
] <4.2.1.circuit>

=== Plots:

#include "1.2.plot_sim.typ"

=== Text Questions:

=== Conclusion:

== 4.2.2. Measurement

=== Introduction


=== Circuit Diagrams:

#figure(caption: [Schematic of the _non-inverting amplifier_ circuit])[
  #image("assets/4.2.2.circuit.jpg", width: 43%)
] <4.2.2.circuit>

=== Plots:

#include "1.2.plot_real.typ"

=== Text Questions:

=== Conclusion

= 4.3 Voltage-to-current converter

== 4.3.1 Simulation

=== Introduction

=== Circuit Diagrams:

#figure(caption: [LTSpice _voltage-to-current converter_ circuit diagram])[
  #image("assets/4.3.1.circuit.jpg", width: 49%)
] <4.3.1.circuit>

=== Plots:

#include "1.3.plot_sim.typ"

=== Text Questions:

=== Conclusion:

== 4.3.2. Measurement

=== Introduction


=== Circuit Diagrams:

#figure(caption: [Schematic of the _voltage-to-current converter_ circuit])[
  #image("assets/4.3.2.circuit.jpg", width: 57%)
] <fig5>

=== Plots:

#include "1.3.plot_real.typ"

=== Text Questions:

we took the voltage after the LED and divided by 470 $Omega$.

$V_(s(m a x)) approx 8.1$ V

=== Conclusion

= 4.4 Transimpedance Amplifier

== 4.4.1 Simulation

=== Introduction

=== Circuit Diagrams:

#figure(caption: [LTSpice _transimpedance amplifier_ circuit diagram])[
  #image("assets/4.4.1.circuit.jpg", width: 55%)
] <fig1>

=== Plots:

#include "1.4.plot_sim.typ"

=== Text Questions:

=== Conclusion:

== 4.4.2. Measurement

=== Introduction


=== Circuit Diagrams:

#figure(caption: [Schematic of the _transimpedance amplifier_ circuit])[
  #image("assets/4.4.2.circuit.jpg", width: 47%)
] <fig5>

=== Plots:

#include "1.4.plot_real.typ"

=== Text Questions:

=== Conclusion

