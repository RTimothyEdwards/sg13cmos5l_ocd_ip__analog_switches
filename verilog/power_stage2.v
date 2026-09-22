/* Behavioral verilog model for the 3.3V power switch (non-inverted enable) */

/* MODELLING CONVENTIONS, common to every switch model here.
 *
 * Direction.  These models are UNIDIRECTIONAL:  each has a specific
 * "input" and "output" which are not physically meaningful in the real
 * circuit.  A real value has no high-impedance state, and iverilog
 * rejects two drivers on a real with "Variable ... cannot have multiple
 * drivers", so switches must be oriented to fan out from a single
 * source.  Where many projects share one bus in the other direction,
 * model the bus as a single resolving mux rather than as many switches.
 *
 * Off state.  Represented by NaN, not by 0.0 or -1.0, so that a
 * disconnected node cannot be mistaken for a legitimately connected
 * zero.  NaN also propagates:  any arithmetic involving it yields NaN,
 * and (x != x) is true only for NaN.  Verilog has no NaN literal, hence
 * the localparam below.
 *
 * Time zero.  No "initial" block is needed.  A continuous assignment
 * evaluates at time 0, so the output is already NaN before the enable is
 * first driven.  An "always @*" block would NOT do this:  it does not
 * run until something in its sensitivity list changes, leaving the
 * output at its default 0.0 --- exactly the value the sentinel exists to
 * distinguish from.
 *
 * BEWARE when extending these.  Every comparison against NaN is false,
 * including NaN == NaN.  A model written as
 *     out = (in > threshold) ? a : b
 * silently takes the "b" branch for a disconnected input instead of
 * propagating the disconnection.  Test for NaN explicitly where that
 * matters.
 */

module power_stage2 (
    `ifdef USE_POWER_PINS
	inout wire DVDD,
	inout wire DVSS,
	inout wire IOVSS,
    `endif

    /* Digital signals */
    input wire enable,

    /* Analog signals */
    input wire real IOVDD_IN,
    output wire real IOVDD_OUT
);

localparam real NAN = 0.0/0.0;

/* A p-only FET, meant to connect to a power supply.  It cannot pull its
 * output down to zero:  below roughly a threshold above ground the
 * device stops conducting.  Driving it with a low input is an invalid
 * use case, modelled coarsely by clamping so that the misuse shows up
 * rather than passing silently.
 */
localparam real PMOS_FLOOR = 0.8;

wire real pint;

assign pint = (IOVDD_IN < PMOS_FLOOR) ? PMOS_FLOOR : IOVDD_IN;

/* Conducts when enable is 1 */
/* Case equality (===) rather than ==.
 *
 * With ==, an unknown enable makes the comparison itself x, and a
 * ternary with an x condition cannot do the bitwise merge on REAL
 * operands that it does on vectors --- it collapses to 0.0.  That is a
 * plausible, connected-looking zero volts, which is exactly what the
 * NaN sentinel exists to prevent, and x is a real state before reset.
 * === treats an unknown enable as "not conducting" and yields NaN.
 */
assign IOVDD_OUT = (enable === 1'b1) ? pint : NAN;

endmodule
