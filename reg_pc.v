module reg_pc(entrada, clk, rst, saida);
  input wire rst, clk;
  input wire [31:0] entrada;
  output reg [31:0] saida;

  always @(posedge clk, posedge rst) begin
    if (rst)
      saida <= 0;
    else
      saida <= entrada;
  end
endmodule