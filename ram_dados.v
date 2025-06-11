module ram_dados(endereco, clk, entrada, we, re, saida);
  input wire clk, we, re;
  input wire [31:0] endereco, entrada;
  output reg [31:0] saida;

  reg [31:0] RAM[0:1023];

  always @(*) begin
    if (re)
      saida = RAM[endereco];
    else
      saida = 32'b0;
  end

  always @(posedge clk) begin
    if (we)
      RAM[endereco] <= entrada;
  end

  initial begin
    RAM[3] = 32'd99;
  end
endmodule