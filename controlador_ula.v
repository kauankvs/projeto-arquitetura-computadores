module controlador_ula(f7, f3, op_ula, cod_ula);
  input wire [1:0] op_ula;
  input wire [6:0] f7;
  input wire [2:0] f3;
  output reg [3:0] cod_ula;

  always @(*) begin
    case(op_ula)
      2'b00: cod_ula = 4'b0010;
      2'b01: cod_ula = 4'b0110;
      2'b10: begin
        case({f7, f3})
          10'b0000000000: cod_ula = 4'b0010;
          10'b0100000000: cod_ula = 4'b0110;
          10'b0000000111: cod_ula = 4'b0000;
          10'b0000000110: cod_ula = 4'b0001;
          default: cod_ula = 4'b0000;
        endcase
      end
      default: cod_ula = 4'b0000;
    endcase
  end
endmodule
