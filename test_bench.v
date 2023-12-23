module tf;

	// Inputs
	reg [63:0] a;
	reg [63:0] b;
	reg cin;

	// Outputs
	wire [63:0] s;
	wire P0;
	wire G0;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	cla_64bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.s(s), 
		.P0(P0), 
		.G0(G0), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		a = 5;
		b = 12;
		cin = 0;
		#100;
		
		a = 5;
		b = 12;
		cin = 0;
		#100;
		
		a = 64'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111;
		b = 64'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111;
		cin = 1;
		#100;
	end
      
endmodule
