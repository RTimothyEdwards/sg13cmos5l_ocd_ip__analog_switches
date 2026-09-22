/* Testbench for the behavioural switch models.
 *
 * Self-checking:  every case asserts, failures are counted, and the run
 * ends with a PASS/FAIL summary.
 *
 *	iverilog -g2012 -o switch_test_tb.out switch_test_tb.v
 *	./switch_test_tb.out
 *
 * The two behaviours checked are:
 *
 *   "switch"   a CMOS transmission gate, passes any in-range value
 *   "pswitch"  a p-only FET, cannot pull below PMOS_FLOOR
 *
 * plus, for every model, that the off state is NaN rather than a
 * plausible number --- including at time zero, before any enable has
 * been driven.
 *
 * NOTES for anyone extending this.  (x != x) is the only reliable NaN
 * test, because NaN == NaN is false.  And iverilog will not accept an
 * expression where $monitor/$display expects a signal, so NaN tests go
 * through a task argument or an intermediate net.
 */

`timescale 1ns/10ps

`include "analog_switch.v"
`include "analog_switch_med.v"
`include "analog_switch_small.v"
`include "analog_pswitch_small.v"
`include "power_stage.v"
`include "power_stage1v2.v"
`include "power_stage2.v"

module switch_test_tb ();

    localparam real PMOS_FLOOR = 0.8;

    integer failures = 0;
    integer checks   = 0;

    /* ---------------------------------------------------------------
     * Check helpers
     * --------------------------------------------------------------- */

    task check_real (input [255:0] what, input real got, input real want);
	begin
	    checks = checks + 1;
	    if (got != got) begin			/* got is NaN */
		failures = failures + 1;
		$display("  FAIL  %0s: got NaN, expected %0.3f", what, want);
	    end else if ((got - want > 0.0005) || (want - got > 0.0005)) begin
		failures = failures + 1;
		$display("  FAIL  %0s: got %0.3f, expected %0.3f", what, got, want);
	    end
	end
    endtask

    task check_off (input [255:0] what, input real got);
	begin
	    checks = checks + 1;
	    if (got == got) begin			/* not NaN */
		failures = failures + 1;
		$display("  FAIL  %0s: off state is %0.3f, expected NaN", what, got);
	    end
	end
    endtask

    /* ---------------------------------------------------------------
     * Devices under test
     * --------------------------------------------------------------- */

    reg        ena  = 1'b0;
    reg        nena = 1'b1;		/* power_stage is active low */
    reg  real  vin;

    wire real sw_out, swm_out, sws_out, psw_out;
    wire real ps_out, ps1v2_out, ps2_out;

    analog_switch        u_sw  (.enable(ena), .in(vin), .out(sw_out));
    analog_switch_med    u_swm (.enable(ena), .in(vin), .out(swm_out));
    analog_switch_small  u_sws (.enable(ena), .in(vin), .out(sws_out));
    analog_pswitch_small u_psw (.enable(ena), .in(vin), .out(psw_out));

    power_stage    u_ps    (.nenable(nena), .IOVDD_IN(vin), .IOVDD_OUT(ps_out));
    power_stage1v2 u_ps1v2 (.enable(ena),   .DVDD_IN(vin),  .DVDD_OUT(ps1v2_out));
    power_stage2   u_ps2   (.enable(ena),   .IOVDD_IN(vin), .IOVDD_OUT(ps2_out));

    /* A switch fed from a disabled one.  Its input is NaN, so its output
     * must be NaN even though it is itself enabled. */
    wire real casc_in, casc_out;
    analog_switch u_casc_a (.enable(1'b0), .in(vin),     .out(casc_in));
    analog_switch u_casc_b (.enable(1'b1), .in(casc_in), .out(casc_out));

    /* ---------------------------------------------------------------
     * Stimulus
     * --------------------------------------------------------------- */

    initial begin
	$dumpfile("switch_test_tb.vcd");
	$dumpvars(0, switch_test_tb);

	/* Time zero.  Nothing has been driven yet;  every output must
	 * already read NaN.  This is the case that catches a model
	 * written with "always @*" instead of a continuous assign, where
	 * the output would sit at its default 0.0 --- indistinguishable
	 * from a legitimately connected zero volts.
	 *
	 * The #0 matters.  Continuous assignments DO evaluate at time
	 * zero, but the ordering between this initial block and their
	 * propagation within the same time step is not guaranteed, so
	 * reading the outputs without settling first sees the default
	 * 0.0 and reports a false failure. */
	#0;
	$display("t=0: outputs must already be NaN, nothing driven yet");
	check_off("analog_switch        at t=0", sw_out);
	check_off("analog_switch_med    at t=0", swm_out);
	check_off("analog_switch_small  at t=0", sws_out);
	check_off("analog_pswitch_small at t=0", psw_out);
	check_off("power_stage          at t=0", ps_out);
	check_off("power_stage1v2       at t=0", ps1v2_out);
	check_off("power_stage2         at t=0", ps2_out);

	vin  = 3.3;
	ena  = 1'b0;
	nena = 1'b1;
	#10;

	$display("all disabled: outputs NaN");
	check_off("analog_switch        disabled", sw_out);
	check_off("analog_switch_med    disabled", swm_out);
	check_off("analog_switch_small  disabled", sws_out);
	check_off("analog_pswitch_small disabled", psw_out);
	check_off("power_stage          disabled", ps_out);
	check_off("power_stage1v2       disabled", ps1v2_out);
	check_off("power_stage2         disabled", ps2_out);

	/* Enable everything.  nena goes LOW to enable power_stage;  if
	 * that model ever loses its inversion, this is what catches it,
	 * and it is the same polarity that validate/switch_polarity
	 * measures in SPICE. */
	ena  = 1'b1;
	nena = 1'b0;
	#10;

	$display("all enabled, in = 3.300");
	check_real("analog_switch        on", sw_out,    3.300);
	check_real("analog_switch_med    on", swm_out,   3.300);
	check_real("analog_switch_small  on", sws_out,   3.300);
	check_real("analog_pswitch_small on", psw_out,   3.300);
	check_real("power_stage          on", ps_out,    3.300);
	check_real("power_stage1v2       on", ps1v2_out, 3.300);
	check_real("power_stage2         on", ps2_out,   3.300);

	vin = 1.200;
	#10;
	$display("in = 1.200, above the pMOS floor: everything passes it");
	check_real("analog_switch        mid", sw_out,  1.200);
	check_real("analog_pswitch_small mid", psw_out, 1.200);
	check_real("power_stage2         mid", ps2_out, 1.200);

	/* Below the floor the two behaviours diverge. */
	vin = 0.0;
	#10;
	$display("in = 0.000, below the pMOS floor: CMOS passes, p-only clamps");
	check_real("analog_switch        at 0V", sw_out,    0.000);
	check_real("analog_switch_med    at 0V", swm_out,   0.000);
	check_real("analog_switch_small  at 0V", sws_out,   0.000);
	check_real("analog_pswitch_small at 0V", psw_out,   PMOS_FLOOR);
	check_real("power_stage          at 0V", ps_out,    PMOS_FLOOR);
	check_real("power_stage1v2       at 0V", ps1v2_out, PMOS_FLOOR);
	check_real("power_stage2         at 0V", ps2_out,   PMOS_FLOOR);

	/* power_stage is active low:  nenable high turns it off while the
	 * active-high parts stay on. */
	vin  = 3.3;
	nena = 1'b1;
	#10;
	$display("polarity: nenable=1 turns power_stage OFF, others stay on");
	check_off ("power_stage  nenable=1", ps_out);
	check_real("power_stage2 still on",  ps2_out, 3.300);

	/* A disconnected input must not become a plausible number. */
	$display("NaN propagates through a cascaded switch");
	check_off("cascaded switch output", casc_out);

	$display("");
	if (failures == 0)
	    $display("PASS  %0d checks", checks);
	else
	    $display("FAIL  %0d of %0d checks failed", failures, checks);
	$finish();
    end

endmodule
