module unidade_ula(a, b, cod_ula, res, z);
  input wire [31:0] a, b;
  input wire [3:0] cod_ula;
  output reg [31:0] res;
  output wire z;

  always @(*) begin
    case (cod_ula)
      4'b0000: res = a & b;
      4'b0001: res = a | b;
      4'b0010: res = a + b;
      4'b0110: res = a - b;
      default: res = 32'b0;
    endcase
  end

  assign z = (res == 32'b0);
endmodule