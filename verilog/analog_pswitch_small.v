/* Behavioral verilog model for the analog p-only switch (small) */

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

/* CURRENT_MODE --- see the note on the pMOS floor below. */

module analog_pswitch_small #(
    parameter CURRENT_MODE = 0
) (
    `ifdef USE_POWER_PINS
	inout wire dvdd,
	inout wire dvss,
	inout wire avdd,
	inout wire avss,
    `endif

    /* Digital signals */
    input wire enable,

    /* Analog signals */
    input wire real in,
    output wire real out
);

localparam real NAN = 0.0/0.0;

/* A p-only FET, meant to connect to a power supply.  It cannot pull its
 * output down to zero:  below roughly a threshold above ground the
 * device stops conducting.  Driving it with a low input is an invalid
 * use case, modelled coarsely by clamping so that the misuse shows up
 * rather than passing silently.
 */
localparam real PMOS_FLOOR = 0.8;

/* CURRENT_MODE disables that clamp.
 *
 * One real per net is the whole limitation of this style of model:  the
 * number has no units, so the model has to be told what it is carrying.
 * The floor above is a VOLTAGE, and it is correct on a net whose real
 * value is a voltage.  On the current-bias distribution it is not:  the
 * value on those nets is a current in amperes, so a 250 nA bias is
 * 2.5e-7, far below 0.8, and the clamp would deliver 0.8 A to the
 * project --- a wrong number that still looks like a number.
 *
 * Instantiate with #(.CURRENT_MODE(1)) on any net carrying a current.
 * The device being modelled is the same either way;  only the meaning
 * of the value passing through it changes.  Verilog-A is what would
 * make this unnecessary, by carrying the branch voltage and current
 * together instead of one anonymous real.
 */
wire real pint;

generate
    if (CURRENT_MODE != 0) begin : gen_current
	assign pint = in;
    end else begin : gen_voltage
	assign pint = (in < PMOS_FLOOR) ? PMOS_FLOOR : in;
    end
endgenerate

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
assign out = (enable === 1'b1) ? pint : NAN;

endmodule
