module registrador_geral(clk, origem1, origem2, destino, escrita, dado_entrada, dado1, dado2);
  input wire clk, escrita;
  input wire [4:0] origem1, origem2, destino;
  input wire [31:0] dado_entrada;
  output wire [31:0] dado1, dado2;

  reg [31:0] banco[31:0];

  assign dado1 = (origem1 != 0) ? banco[origem1] : 32'd0;
  assign dado2 = (origem2 != 0) ? banco[origem2] : 32'd0;

  always @(posedge clk) begin
    if (escrita && destino != 0)
      banco[destino] <= dado_entrada;
  end

  initial begin
    banco[0] = 32'd0;
    banco[2] = 32'd5;
    banco[3] = 32'd10;
  end
endmodule
