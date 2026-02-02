//========================================================================
// PairTripleDetector_GL
//========================================================================

`ifndef PAIR_TRIPLE_DETECTOR_GL_V
`define PAIR_TRIPLE_DETECTOR_GL_V

`include "ece2300-misc.v"

  //''' ACTIVITY '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  // Implement pair/triple detector using explicit gate-level modeling
  //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
module PairTripleDetector_GL
(
  input  wire in0,
  input  wire in1,
  input  wire in2,
  output wire out
);

  // NOT gates to create complement of each input

  wire in0_n, in1_n, in2_n;

  not( in0_n, in0 );
  not( in1_n, in1 );
  not( in2_n, in2 );

  // AND gates for each row in the truth table where output is one

  wire row3, row5, row6, row7;

  and( row3, in0_n, in1,   in2   );
  and( row5, in0,   in1_n, in2   );
  and( row6, in0,   in1,   in2_n );
  and( row7, in0,   in1,   in2   );

  // OR together the outputs of the AND gates

  or( out, row3, row5, row6, row7 );

endmodule

`endif /* PAIR_TRIPLE_DETECTOR_GL_V */

