# 64-bit Carry Look-Ahead Adder (CLA-64)

## Description

This Verilog project implements a 64-bit Carry Look-Ahead Adder (CLA-64). The design is hierarchical, consisting of Partial Full Adders (PFA) and 4-bit Carry Look-Ahead Adders (CLA-4bit) as building blocks. The final 64-bit adder is created by instantiating four instances of CLA-16bit.

## Modules

### Partial Full Adder (PFA)

```verilog
module pfa(input a, b, cin, output s, p, g);
	assign g = a & b;
	assign p = a ^ b;
	assign s = cin ^ p;
endmodule
```

### 4-bit Carry Look-Ahead Adder (CLA-4bit)

```verilog
module cla_4bit(input [3:0] a, b, input cin, output [3:0] s, output reg P0, G0);
   reg [3:0] c;
	wire [3:0] p, g;
	// ... instantiation of four PFAs ...

	always @ (*)
	begin
		// ... carry calculation logic ...
	end
endmodule
```

### 16-bit Carry Look-Ahead Adder (CLA-16bit)

```verilog
module cla_16bit(input [15:0] a, b, input cin, output [15:0] s, output reg P0, G0);
	// ... instantiation of four CLA-4bit instances ...

	always @ (*)
	begin
		// ... carry calculation logic ...
	end
endmodule
```

### 64-bit Carry Look-Ahead Adder (CLA-64)

```verilog
module cla_64bit(input [63:0] a, b, input cin, output [63:0] s, output reg P0, G0, cout);
	// ... instantiation of four CLA-16bit instances ...

	always @ (*)
	begin
		// ... carry calculation logic ...
		cout = G0 + P0 * cin;
	end
endmodule
```

## Simulation

This project includes a testbench (`tf`) to simulate the CLA-64 module.

### Circuit Diagram

![image](https://github.com/WajeehaTahir/64-bit-cla/assets/88159584/204d6fd6-5358-4e76-b4ec-8ba7629bc1c7)


### Waveform

![image](https://github.com/WajeehaTahir/64-bit-cla/assets/88159584/9bbf62ee-ab5b-4dd3-a8ab-e8a75e13df94)


## Usage

To use this Verilog module in your own project, instantiate the `cla_64bit` module and provide the necessary inputs and outputs. The design can be synthesized and implemented on an FPGA.
#
_Documented by ChatGPT_
