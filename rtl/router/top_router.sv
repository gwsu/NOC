/*
 *	Top file for single router validation
 *
 *	Author: Ilan, Nina, Joe, Mitchell
 *	Date: 12/20/2012
 */

//		`timescale 1ns/1ns

module top_router();
   bit clk = 1;
   always #5 clk = ~clk;

   initial $vcdpluson;

   ifc North_to(clk);
   ifc North_from(clk);
   ifc South_to(clk);
   ifc South_from(clk);
   ifc East_to(clk);
   ifc East_from(clk);
   ifc West_to(clk);
   ifc West_from(clk);
   ifc Local_to(clk);
   ifc Local_from(clk);

   ifc ctrl(clk);

   tb_router bench (North_to.bench, North_from.bench,
		    South_to.bench, South_from.bench,
		    East_to.bench, East_from.bench,
		    West_to.bench, West_from.bench,
		    Local_to.bench, Local_from.bench,
		    ctrl.bench );

   router#(.XCOORD('b0001), .YCOORD('b0001)) dut
     (	North_to.send, North_from.receive,
	South_to.send, South_from.receive,
	East_to.send, East_from.receive,
	West_to.send, West_from.receive,
	Local_to.send, Local_from.receive,
	ctrl.control
	);

endmodule
