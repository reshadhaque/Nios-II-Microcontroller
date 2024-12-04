	cpu u0 (
		.clk_clk        (<connected-to-clk_clk>),        //   clk.clk
		.reset_reset_n  (<connected-to-reset_reset_n>),  // reset.reset_n
		.io_acknowledge (<connected-to-io_acknowledge>), //    io.acknowledge
		.io_irq         (<connected-to-io_irq>),         //      .irq
		.io_address     (<connected-to-io_address>),     //      .address
		.io_bus_enable  (<connected-to-io_bus_enable>),  //      .bus_enable
		.io_byte_enable (<connected-to-io_byte_enable>), //      .byte_enable
		.io_rw          (<connected-to-io_rw>),          //      .rw
		.io_write_data  (<connected-to-io_write_data>),  //      .write_data
		.io_read_data   (<connected-to-io_read_data>)    //      .read_data
	);

