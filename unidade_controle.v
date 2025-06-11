module unidade_controle(opcode, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op);
  input wire [6:0] opcode;
  output wire alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch;
  output wire [1:0] alu_op;

  reg [7:0] sinais;

  always @(*) begin
    case(opcode)
      7'b0110011: sinais = 8'b0_0_1_0_0_0_10;
      7'b0000011: sinais = 8'b1_1_1_1_0_0_00;
      7'b0100011: sinais = 8'b1_0_0_0_1_0_00;
      7'b1100011: sinais = 8'b0_0_0_0_0_1_01;
      7'b0000000: sinais = 8'b0_0_0_0_0_0_00;
      default: sinais = 8'b0_0_0_0_0_0_00;
    endcase
  end

  assign {alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op} = sinais;
endmodule