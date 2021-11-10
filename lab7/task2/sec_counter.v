module sec_counter(MAX10_CLK1_50,sec_tick);

input MAX10_CLK1_50;
output sec_tick;

clktick one_sec(MAX10_CLK1_50,sec_tick,26'd50000000,1'b1);

endmodule 