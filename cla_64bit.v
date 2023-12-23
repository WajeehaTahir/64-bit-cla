module pfa(input a, b, cin, output s, p, g);
	assign g = a & b;
	assign p = a ^ b;
	assign s = cin ^ p;
endmodule

module cla_4bit(input [3:0] a, b, input cin, output [3:0] s, output reg P0, G0);
   reg [3:0] c;
	wire [3:0] p, g;
	pfa obj0(a[0], b[0], cin, s[0], p[0], g[0]);
	pfa obj1(a[1], b[1], c[0], s[1], p[1], g[1]);
	pfa obj2(a[2], b[2], c[1], s[2], p[2], g[2]);
	pfa obj3(a[3], b[3], c[2], s[3], p[3], g[3]);
	
	always @ (*)
	begin
	c[0] = g[0] + (p[0] * cin);
	c[1] = g[1] + (p[1] * g[0]) + (p[0] * p[1] * cin);
	c[2] = g[2] + (p[2] * g[1]) + (p[2] * p[1] * g[0]) + (p[2] * p[1] * p[0] * cin);
	c[3] = g[3] + (p[3] * g[2]) + (p[3] * p[2] * g[1]) + (p[3] * p[2] * p[1] * g[0]) + (p[3] * p[2] * p[1] * p[0] * cin);
		
	G0 = g[3] + (p[3] * g[2]) + (p[3] * p[2] * g[1]) + (p[3] * p[2] * p[1] * g[0]);
	P0 = p[3] * p[2] * p[1] * p[0];
	
	end
endmodule

module cla_16bit(input [15:0] a, b, input cin, output [15:0] s, output reg P0, G0);
	reg [3:0] c;
	wire [3:0] p, g;
	cla_4bit obj0(a[3:0], b[3:0], cin, s[3:0], p[0], g[0]);
	cla_4bit obj1(a[7:4], b[7:4], c[0], s[7:4], p[1], g[1]);
	cla_4bit obj2(a[11:8], b[11:8], c[1], s[11:8], p[2], g[2]);
	cla_4bit obj3(a[15:12], b[15:12], c[2], s[15:12], p[3], g[3]);
	
	always @ (*)
	begin
	c[0] = g[0] + (p[0] * cin);
	c[1] = g[1] + (p[1] * g[0]) + (p[0] * p[1] * cin);
	c[2] = g[2] + (p[2] * g[1]) + (p[2] * p[1] * g[0]) + (p[2] * p[1] * p[0] * cin);
	c[3] = g[3] + (p[3] * g[2]) + (p[3] * p[2] * g[1]) + (p[3] * p[2] * p[1] * g[0]) + (p[3] * p[2] * p[1] * p[0] * cin);
		
	G0 = g[3] + (p[3] * g[2]) + (p[3] * p[2] * g[1]) + (p[3] * p[2] * p[1] * g[0]);
	P0 = p[3] * p[2] * p[1] * p[0];
	
	end
endmodule

module cla_64bit(input [63:0] a, b, input cin, output [63:0] s, output reg P0, G0, cout);
	reg [3:0] c;
	wire [3:0] p, g;
	cla_16bit obj0(a[15:0], b[15:0], cin, s[15:0], p[0], g[0]);
	cla_16bit obj1(a[31:16], b[31:16], c[0], s[31:16], p[1], g[1]);
	cla_16bit obj2(a[47:32], b[47:32], c[1], s[47:32], p[2], g[2]);
	cla_16bit obj3(a[63:48], b[63:48], c[2], s[63:48], p[3], g[3]);
	
	always @ (*)
	begin
	c[0] = g[0] + (p[0] * cin);
	c[1] = g[1] + (p[1] * g[0]) + (p[0] * p[1] * cin);
	c[2] = g[2] + (p[2] * g[1]) + (p[2] * p[1] * g[0]) + (p[2] * p[1] * p[0] * cin);
	c[3] = g[3] + (p[3] * g[2]) + (p[3] * p[2] * g[1]) + (p[3] * p[2] * p[1] * g[0]) + (p[3] * p[2] * p[1] * p[0] * cin);
		
	G0 = g[3] + (p[3] * g[2]) + (p[3] * p[2] * g[1]) + (p[3] * p[2] * p[1] * g[0]);
	P0 = p[3] * p[2] * p[1] * p[0];
	
	cout = G0 + P0 * cin;
	end
endmodule
