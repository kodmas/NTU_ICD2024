/// Example File: inv_hspice.sp ///
.lib 'cic018.l' TT
.include "inv.pex.sp"

.global vdd gnd

xinv in vdd gnd out inv

Vvdd vdd gnd 1.8v
Vin in gnd PULSE 0v 1.8v 400ps 100ps 100ps 400ps 1000ps

.probe v(out)

.option post
.tran 10p 5n
.ic v(out) = 1.8v
.end