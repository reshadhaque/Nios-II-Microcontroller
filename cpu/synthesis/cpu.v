// cpu.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module cpu (
		input  wire        clk_clk,        //   clk.clk
		input  wire        io_acknowledge, //    io.acknowledge
		input  wire        io_irq,         //      .irq
		output wire [11:0] io_address,     //      .address
		output wire        io_bus_enable,  //      .bus_enable
		output wire [1:0]  io_byte_enable, //      .byte_enable
		output wire        io_rw,          //      .rw
		output wire [15:0] io_write_data,  //      .write_data
		input  wire [15:0] io_read_data,   //      .read_data
		input  wire        reset_reset_n   // reset.reset_n
	);

	wire  [31:0] nios_data_master_readdata;                                           // mm_interconnect_0:NIOS_data_master_readdata -> NIOS:d_readdata
	wire         nios_data_master_waitrequest;                                        // mm_interconnect_0:NIOS_data_master_waitrequest -> NIOS:d_waitrequest
	wire         nios_data_master_debugaccess;                                        // NIOS:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:NIOS_data_master_debugaccess
	wire  [13:0] nios_data_master_address;                                            // NIOS:d_address -> mm_interconnect_0:NIOS_data_master_address
	wire   [3:0] nios_data_master_byteenable;                                         // NIOS:d_byteenable -> mm_interconnect_0:NIOS_data_master_byteenable
	wire         nios_data_master_read;                                               // NIOS:d_read -> mm_interconnect_0:NIOS_data_master_read
	wire         nios_data_master_readdatavalid;                                      // mm_interconnect_0:NIOS_data_master_readdatavalid -> NIOS:d_readdatavalid
	wire         nios_data_master_write;                                              // NIOS:d_write -> mm_interconnect_0:NIOS_data_master_write
	wire  [31:0] nios_data_master_writedata;                                          // NIOS:d_writedata -> mm_interconnect_0:NIOS_data_master_writedata
	wire  [31:0] nios_instruction_master_readdata;                                    // mm_interconnect_0:NIOS_instruction_master_readdata -> NIOS:i_readdata
	wire         nios_instruction_master_waitrequest;                                 // mm_interconnect_0:NIOS_instruction_master_waitrequest -> NIOS:i_waitrequest
	wire  [13:0] nios_instruction_master_address;                                     // NIOS:i_address -> mm_interconnect_0:NIOS_instruction_master_address
	wire         nios_instruction_master_read;                                        // NIOS:i_read -> mm_interconnect_0:NIOS_instruction_master_read
	wire         nios_instruction_master_readdatavalid;                               // mm_interconnect_0:NIOS_instruction_master_readdatavalid -> NIOS:i_readdatavalid
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_chipselect;                 // mm_interconnect_0:JTAG_avalon_jtag_slave_chipselect -> JTAG:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_avalon_jtag_slave_readdata;                   // JTAG:av_readdata -> mm_interconnect_0:JTAG_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_waitrequest;                // JTAG:av_waitrequest -> mm_interconnect_0:JTAG_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_avalon_jtag_slave_address;                    // mm_interconnect_0:JTAG_avalon_jtag_slave_address -> JTAG:av_address
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_read;                       // mm_interconnect_0:JTAG_avalon_jtag_slave_read -> JTAG:av_read_n
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_write;                      // mm_interconnect_0:JTAG_avalon_jtag_slave_write -> JTAG:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_avalon_jtag_slave_writedata;                  // mm_interconnect_0:JTAG_avalon_jtag_slave_writedata -> JTAG:av_writedata
	wire         mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_chipselect;  // mm_interconnect_0:to_external_bus_bridge_0_avalon_slave_chipselect -> to_external_bus_bridge_0:avalon_chipselect
	wire  [15:0] mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_readdata;    // to_external_bus_bridge_0:avalon_readdata -> mm_interconnect_0:to_external_bus_bridge_0_avalon_slave_readdata
	wire         mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_waitrequest; // to_external_bus_bridge_0:avalon_waitrequest -> mm_interconnect_0:to_external_bus_bridge_0_avalon_slave_waitrequest
	wire  [10:0] mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_address;     // mm_interconnect_0:to_external_bus_bridge_0_avalon_slave_address -> to_external_bus_bridge_0:avalon_address
	wire         mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_read;        // mm_interconnect_0:to_external_bus_bridge_0_avalon_slave_read -> to_external_bus_bridge_0:avalon_read
	wire   [1:0] mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_byteenable;  // mm_interconnect_0:to_external_bus_bridge_0_avalon_slave_byteenable -> to_external_bus_bridge_0:avalon_byteenable
	wire         mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_write;       // mm_interconnect_0:to_external_bus_bridge_0_avalon_slave_write -> to_external_bus_bridge_0:avalon_write
	wire  [15:0] mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_writedata;   // mm_interconnect_0:to_external_bus_bridge_0_avalon_slave_writedata -> to_external_bus_bridge_0:avalon_writedata
	wire  [31:0] mm_interconnect_0_nios_debug_mem_slave_readdata;                     // NIOS:debug_mem_slave_readdata -> mm_interconnect_0:NIOS_debug_mem_slave_readdata
	wire         mm_interconnect_0_nios_debug_mem_slave_waitrequest;                  // NIOS:debug_mem_slave_waitrequest -> mm_interconnect_0:NIOS_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_nios_debug_mem_slave_debugaccess;                  // mm_interconnect_0:NIOS_debug_mem_slave_debugaccess -> NIOS:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_nios_debug_mem_slave_address;                      // mm_interconnect_0:NIOS_debug_mem_slave_address -> NIOS:debug_mem_slave_address
	wire         mm_interconnect_0_nios_debug_mem_slave_read;                         // mm_interconnect_0:NIOS_debug_mem_slave_read -> NIOS:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_nios_debug_mem_slave_byteenable;                   // mm_interconnect_0:NIOS_debug_mem_slave_byteenable -> NIOS:debug_mem_slave_byteenable
	wire         mm_interconnect_0_nios_debug_mem_slave_write;                        // mm_interconnect_0:NIOS_debug_mem_slave_write -> NIOS:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_nios_debug_mem_slave_writedata;                    // mm_interconnect_0:NIOS_debug_mem_slave_writedata -> NIOS:debug_mem_slave_writedata
	wire         mm_interconnect_0_ram_s1_chipselect;                                 // mm_interconnect_0:RAM_s1_chipselect -> RAM:chipselect
	wire  [31:0] mm_interconnect_0_ram_s1_readdata;                                   // RAM:readdata -> mm_interconnect_0:RAM_s1_readdata
	wire   [9:0] mm_interconnect_0_ram_s1_address;                                    // mm_interconnect_0:RAM_s1_address -> RAM:address
	wire   [3:0] mm_interconnect_0_ram_s1_byteenable;                                 // mm_interconnect_0:RAM_s1_byteenable -> RAM:byteenable
	wire         mm_interconnect_0_ram_s1_write;                                      // mm_interconnect_0:RAM_s1_write -> RAM:write
	wire  [31:0] mm_interconnect_0_ram_s1_writedata;                                  // mm_interconnect_0:RAM_s1_writedata -> RAM:writedata
	wire         mm_interconnect_0_ram_s1_clken;                                      // mm_interconnect_0:RAM_s1_clken -> RAM:clken
	wire         irq_mapper_receiver0_irq;                                            // to_external_bus_bridge_0:avalon_irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                            // JTAG:av_irq -> irq_mapper:receiver1_irq
	wire  [31:0] nios_irq_irq;                                                        // irq_mapper:sender_irq -> NIOS:irq
	wire         rst_controller_reset_out_reset;                                      // rst_controller:reset_out -> [JTAG:rst_n, NIOS:reset_n, RAM:reset, irq_mapper:reset, mm_interconnect_0:NIOS_reset_reset_bridge_in_reset_reset, rst_translator:in_reset, to_external_bus_bridge_0:reset]
	wire         rst_controller_reset_out_reset_req;                                  // rst_controller:reset_req -> [NIOS:reset_req, RAM:reset_req, rst_translator:reset_req_in]

	cpu_JTAG jtag (
		.clk            (clk_clk),                                              //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                      //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver1_irq)                              //               irq.irq
	);

	cpu_NIOS nios (
		.clk                                 (clk_clk),                                            //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                    //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                 //                          .reset_req
		.d_address                           (nios_data_master_address),                           //               data_master.address
		.d_byteenable                        (nios_data_master_byteenable),                        //                          .byteenable
		.d_read                              (nios_data_master_read),                              //                          .read
		.d_readdata                          (nios_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (nios_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (nios_data_master_write),                             //                          .write
		.d_writedata                         (nios_data_master_writedata),                         //                          .writedata
		.d_readdatavalid                     (nios_data_master_readdatavalid),                     //                          .readdatavalid
		.debug_mem_slave_debugaccess_to_roms (nios_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (nios_instruction_master_address),                    //        instruction_master.address
		.i_read                              (nios_instruction_master_read),                       //                          .read
		.i_readdata                          (nios_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (nios_instruction_master_waitrequest),                //                          .waitrequest
		.i_readdatavalid                     (nios_instruction_master_readdatavalid),              //                          .readdatavalid
		.irq                                 (nios_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (),                                                   //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_nios_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_nios_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_nios_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_nios_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_nios_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_nios_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_nios_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_nios_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                    // custom_instruction_master.readra
	);

	cpu_RAM ram (
		.clk        (clk_clk),                             //   clk1.clk
		.address    (mm_interconnect_0_ram_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_ram_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_ram_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_ram_s1_write),      //       .write
		.readdata   (mm_interconnect_0_ram_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_ram_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_ram_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),      // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req),  //       .reset_req
		.freeze     (1'b0)                                 // (terminated)
	);

	cpu_to_external_bus_bridge_0 to_external_bus_bridge_0 (
		.clk                (clk_clk),                                                             //                clk.clk
		.reset              (rst_controller_reset_out_reset),                                      //              reset.reset
		.avalon_address     (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_address),     //       avalon_slave.address
		.avalon_byteenable  (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_byteenable),  //                   .byteenable
		.avalon_chipselect  (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_chipselect),  //                   .chipselect
		.avalon_read        (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_read),        //                   .read
		.avalon_write       (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_write),       //                   .write
		.avalon_writedata   (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_writedata),   //                   .writedata
		.avalon_readdata    (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_readdata),    //                   .readdata
		.avalon_waitrequest (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_waitrequest), //                   .waitrequest
		.avalon_irq         (irq_mapper_receiver0_irq),                                            //          interrupt.irq
		.acknowledge        (io_acknowledge),                                                      // external_interface.export
		.irq                (io_irq),                                                              //                   .export
		.address            (io_address),                                                          //                   .export
		.bus_enable         (io_bus_enable),                                                       //                   .export
		.byte_enable        (io_byte_enable),                                                      //                   .export
		.rw                 (io_rw),                                                               //                   .export
		.write_data         (io_write_data),                                                       //                   .export
		.read_data          (io_read_data)                                                         //                   .export
	);

	cpu_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                     (clk_clk),                                                             //                             clk_0_clk.clk
		.NIOS_reset_reset_bridge_in_reset_reset            (rst_controller_reset_out_reset),                                      //      NIOS_reset_reset_bridge_in_reset.reset
		.NIOS_data_master_address                          (nios_data_master_address),                                            //                      NIOS_data_master.address
		.NIOS_data_master_waitrequest                      (nios_data_master_waitrequest),                                        //                                      .waitrequest
		.NIOS_data_master_byteenable                       (nios_data_master_byteenable),                                         //                                      .byteenable
		.NIOS_data_master_read                             (nios_data_master_read),                                               //                                      .read
		.NIOS_data_master_readdata                         (nios_data_master_readdata),                                           //                                      .readdata
		.NIOS_data_master_readdatavalid                    (nios_data_master_readdatavalid),                                      //                                      .readdatavalid
		.NIOS_data_master_write                            (nios_data_master_write),                                              //                                      .write
		.NIOS_data_master_writedata                        (nios_data_master_writedata),                                          //                                      .writedata
		.NIOS_data_master_debugaccess                      (nios_data_master_debugaccess),                                        //                                      .debugaccess
		.NIOS_instruction_master_address                   (nios_instruction_master_address),                                     //               NIOS_instruction_master.address
		.NIOS_instruction_master_waitrequest               (nios_instruction_master_waitrequest),                                 //                                      .waitrequest
		.NIOS_instruction_master_read                      (nios_instruction_master_read),                                        //                                      .read
		.NIOS_instruction_master_readdata                  (nios_instruction_master_readdata),                                    //                                      .readdata
		.NIOS_instruction_master_readdatavalid             (nios_instruction_master_readdatavalid),                               //                                      .readdatavalid
		.JTAG_avalon_jtag_slave_address                    (mm_interconnect_0_jtag_avalon_jtag_slave_address),                    //                JTAG_avalon_jtag_slave.address
		.JTAG_avalon_jtag_slave_write                      (mm_interconnect_0_jtag_avalon_jtag_slave_write),                      //                                      .write
		.JTAG_avalon_jtag_slave_read                       (mm_interconnect_0_jtag_avalon_jtag_slave_read),                       //                                      .read
		.JTAG_avalon_jtag_slave_readdata                   (mm_interconnect_0_jtag_avalon_jtag_slave_readdata),                   //                                      .readdata
		.JTAG_avalon_jtag_slave_writedata                  (mm_interconnect_0_jtag_avalon_jtag_slave_writedata),                  //                                      .writedata
		.JTAG_avalon_jtag_slave_waitrequest                (mm_interconnect_0_jtag_avalon_jtag_slave_waitrequest),                //                                      .waitrequest
		.JTAG_avalon_jtag_slave_chipselect                 (mm_interconnect_0_jtag_avalon_jtag_slave_chipselect),                 //                                      .chipselect
		.NIOS_debug_mem_slave_address                      (mm_interconnect_0_nios_debug_mem_slave_address),                      //                  NIOS_debug_mem_slave.address
		.NIOS_debug_mem_slave_write                        (mm_interconnect_0_nios_debug_mem_slave_write),                        //                                      .write
		.NIOS_debug_mem_slave_read                         (mm_interconnect_0_nios_debug_mem_slave_read),                         //                                      .read
		.NIOS_debug_mem_slave_readdata                     (mm_interconnect_0_nios_debug_mem_slave_readdata),                     //                                      .readdata
		.NIOS_debug_mem_slave_writedata                    (mm_interconnect_0_nios_debug_mem_slave_writedata),                    //                                      .writedata
		.NIOS_debug_mem_slave_byteenable                   (mm_interconnect_0_nios_debug_mem_slave_byteenable),                   //                                      .byteenable
		.NIOS_debug_mem_slave_waitrequest                  (mm_interconnect_0_nios_debug_mem_slave_waitrequest),                  //                                      .waitrequest
		.NIOS_debug_mem_slave_debugaccess                  (mm_interconnect_0_nios_debug_mem_slave_debugaccess),                  //                                      .debugaccess
		.RAM_s1_address                                    (mm_interconnect_0_ram_s1_address),                                    //                                RAM_s1.address
		.RAM_s1_write                                      (mm_interconnect_0_ram_s1_write),                                      //                                      .write
		.RAM_s1_readdata                                   (mm_interconnect_0_ram_s1_readdata),                                   //                                      .readdata
		.RAM_s1_writedata                                  (mm_interconnect_0_ram_s1_writedata),                                  //                                      .writedata
		.RAM_s1_byteenable                                 (mm_interconnect_0_ram_s1_byteenable),                                 //                                      .byteenable
		.RAM_s1_chipselect                                 (mm_interconnect_0_ram_s1_chipselect),                                 //                                      .chipselect
		.RAM_s1_clken                                      (mm_interconnect_0_ram_s1_clken),                                      //                                      .clken
		.to_external_bus_bridge_0_avalon_slave_address     (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_address),     // to_external_bus_bridge_0_avalon_slave.address
		.to_external_bus_bridge_0_avalon_slave_write       (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_write),       //                                      .write
		.to_external_bus_bridge_0_avalon_slave_read        (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_read),        //                                      .read
		.to_external_bus_bridge_0_avalon_slave_readdata    (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_readdata),    //                                      .readdata
		.to_external_bus_bridge_0_avalon_slave_writedata   (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_writedata),   //                                      .writedata
		.to_external_bus_bridge_0_avalon_slave_byteenable  (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_byteenable),  //                                      .byteenable
		.to_external_bus_bridge_0_avalon_slave_waitrequest (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_waitrequest), //                                      .waitrequest
		.to_external_bus_bridge_0_avalon_slave_chipselect  (mm_interconnect_0_to_external_bus_bridge_0_avalon_slave_chipselect)   //                                      .chipselect
	);

	cpu_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.sender_irq    (nios_irq_irq)                    //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule