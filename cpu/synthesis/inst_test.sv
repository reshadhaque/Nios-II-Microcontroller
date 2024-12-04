
module inst_test(input logic clk, input logic reset /*input logic irq,
output logic [11:0] address, input logic acknowledge, output logic bus_enable, 
output logic [1:0] byte_enable, output logic rw, output logic [15:0] writedata,
output logic [15:0] readdata*/);

logic irq;
logic [11:0] address;
logic acknowledge;
logic bus_enable;
logic [1:0] byte_enable;
logic rw;
logic [15:0] writedata;
logic [15:0] readdata;

cpu u0 (
		.clk_clk        (clk),        //   clk.clk
		.reset_reset_n  (reset),  // reset.reset_n
		.io_acknowledge (acknowledge), //    io.acknowledge
		.io_irq         (irq),         //      .irq
		.io_address     (address),     //      .address
		.io_bus_enable  (bus_enable),  //      .bus_enable
		.io_byte_enable (byte_enable), //      .byte_enable
		.io_rw          (rw),          //      .rw
		.io_write_data  (writedata),  //      .write_data
		.io_read_data   (readdata)    //      .read_data
	);

endmodule