module hex_to_7seg(
  output [6:0] io_out,
  input  [3:0] io_in
);
  wire  _T = 4'h0 == io_in; // @[Conditional.scala 37:30]
  wire  _T_1 = 4'h1 == io_in; // @[Conditional.scala 37:30]
  wire  _T_2 = 4'h2 == io_in; // @[Conditional.scala 37:30]
  wire  _T_3 = 4'h3 == io_in; // @[Conditional.scala 37:30]
  wire  _T_4 = 4'h4 == io_in; // @[Conditional.scala 37:30]
  wire  _T_5 = 4'h5 == io_in; // @[Conditional.scala 37:30]
  wire  _T_6 = 4'h6 == io_in; // @[Conditional.scala 37:30]
  wire  _T_7 = 4'h7 == io_in; // @[Conditional.scala 37:30]
  wire  _T_8 = 4'h8 == io_in; // @[Conditional.scala 37:30]
  wire  _T_9 = 4'h9 == io_in; // @[Conditional.scala 37:30]
  wire  _T_10 = 4'ha == io_in; // @[Conditional.scala 37:30]
  wire  _T_11 = 4'hb == io_in; // @[Conditional.scala 37:30]
  wire  _T_12 = 4'hc == io_in; // @[Conditional.scala 37:30]
  wire  _T_13 = 4'hd == io_in; // @[Conditional.scala 37:30]
  wire  _T_14 = 4'he == io_in; // @[Conditional.scala 37:30]
  wire  _T_15 = 4'hf == io_in; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_0 = _T_15 ? 4'he : 4'h0; // @[Conditional.scala 39:67 hex_to_7seg.scala 65:16 hex_to_7seg.scala 14:9]
  wire [3:0] _GEN_1 = _T_14 ? 4'h6 : _GEN_0; // @[Conditional.scala 39:67 hex_to_7seg.scala 62:16]
  wire [5:0] _GEN_2 = _T_13 ? 6'h21 : {{2'd0}, _GEN_1}; // @[Conditional.scala 39:67 hex_to_7seg.scala 59:16]
  wire [6:0] _GEN_3 = _T_12 ? 7'h46 : {{1'd0}, _GEN_2}; // @[Conditional.scala 39:67 hex_to_7seg.scala 56:16]
  wire [6:0] _GEN_4 = _T_11 ? 7'h3 : _GEN_3; // @[Conditional.scala 39:67 hex_to_7seg.scala 52:16]
  wire [6:0] _GEN_5 = _T_10 ? 7'h8 : _GEN_4; // @[Conditional.scala 39:67 hex_to_7seg.scala 49:16]
  wire [6:0] _GEN_6 = _T_9 ? 7'h18 : _GEN_5; // @[Conditional.scala 39:67 hex_to_7seg.scala 45:16]
  wire [6:0] _GEN_7 = _T_8 ? 7'h0 : _GEN_6; // @[Conditional.scala 39:67 hex_to_7seg.scala 42:16]
  wire [6:0] _GEN_8 = _T_7 ? 7'h78 : _GEN_7; // @[Conditional.scala 39:67 hex_to_7seg.scala 39:17]
  wire [6:0] _GEN_9 = _T_6 ? 7'h2 : _GEN_8; // @[Conditional.scala 39:67 hex_to_7seg.scala 36:17]
  wire [6:0] _GEN_10 = _T_5 ? 7'h12 : _GEN_9; // @[Conditional.scala 39:67 hex_to_7seg.scala 33:17]
  wire [6:0] _GEN_11 = _T_4 ? 7'h19 : _GEN_10; // @[Conditional.scala 39:67 hex_to_7seg.scala 30:17]
  wire [6:0] _GEN_12 = _T_3 ? 7'h30 : _GEN_11; // @[Conditional.scala 39:67 hex_to_7seg.scala 27:17]
  wire [6:0] _GEN_13 = _T_2 ? 7'h24 : _GEN_12; // @[Conditional.scala 39:67 hex_to_7seg.scala 24:17]
  wire [6:0] _GEN_14 = _T_1 ? 7'h79 : _GEN_13; // @[Conditional.scala 39:67 hex_to_7seg.scala 21:17]
  assign io_out = _T ? 7'h40 : _GEN_14; // @[Conditional.scala 40:58 hex_to_7seg.scala 18:17]
endmodule
//module hex_to_7seg    (out,in);
//
//	output	[6:0] out;//active low
//   input [3:0] in;
//	reg	[6:0] out;//make out a variable value
//	always @ (*)
//		case (in)
//		4'h0: out = 7'b1000000;
//		4'h1: out = 7'b1111001;
//		4'h2: out = 7'b0100100;
//		4'h3: out = 7'b0110000;
//		4'h4: out = 7'b0011001;
//		4'h5: out = 7'b0010010;
//		4'h6: out = 7'b0000010;
//		4'h7: out = 7'b1111000;
//		4'h8: out = 7'b0000000;
//		4'h9: out = 7'b0011000;
//		4'ha: out = 7'b0001000;
//		4'hb: out = 7'b0000011;
//		4'hc: out = 7'b1000110;
//		4'hd: out = 7'b0100001;
//		4'he: out = 7'b0000110;
//		4'hf: out = 7'b0001110;
//		endcase
//endmodule
