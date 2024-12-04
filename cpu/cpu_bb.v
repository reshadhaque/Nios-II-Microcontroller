
module cpu (
	clk_clk,
	reset_reset_n,
	io_acknowledge,
	io_irq,
	io_address,
	io_bus_enable,
	io_byte_enable,
	io_rw,
	io_write_data,
	io_read_data);	

	input		clk_clk;
	input		reset_reset_n;
	input		io_acknowledge;
	input		io_irq;
	output	[11:0]	io_address;
	output		io_bus_enable;
	output	[1:0]	io_byte_enable;
	output		io_rw;
	output	[15:0]	io_write_data;
	input	[15:0]	io_read_data;
endmodule
