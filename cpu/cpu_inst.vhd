	component cpu is
		port (
			clk_clk        : in  std_logic                     := 'X';             -- clk
			reset_reset_n  : in  std_logic                     := 'X';             -- reset_n
			io_acknowledge : in  std_logic                     := 'X';             -- acknowledge
			io_irq         : in  std_logic                     := 'X';             -- irq
			io_address     : out std_logic_vector(11 downto 0);                    -- address
			io_bus_enable  : out std_logic;                                        -- bus_enable
			io_byte_enable : out std_logic_vector(1 downto 0);                     -- byte_enable
			io_rw          : out std_logic;                                        -- rw
			io_write_data  : out std_logic_vector(15 downto 0);                    -- write_data
			io_read_data   : in  std_logic_vector(15 downto 0) := (others => 'X')  -- read_data
		);
	end component cpu;

	u0 : component cpu
		port map (
			clk_clk        => CONNECTED_TO_clk_clk,        --   clk.clk
			reset_reset_n  => CONNECTED_TO_reset_reset_n,  -- reset.reset_n
			io_acknowledge => CONNECTED_TO_io_acknowledge, --    io.acknowledge
			io_irq         => CONNECTED_TO_io_irq,         --      .irq
			io_address     => CONNECTED_TO_io_address,     --      .address
			io_bus_enable  => CONNECTED_TO_io_bus_enable,  --      .bus_enable
			io_byte_enable => CONNECTED_TO_io_byte_enable, --      .byte_enable
			io_rw          => CONNECTED_TO_io_rw,          --      .rw
			io_write_data  => CONNECTED_TO_io_write_data,  --      .write_data
			io_read_data   => CONNECTED_TO_io_read_data    --      .read_data
		);

