module datapath(clk, rst);
  input wire clk, rst;

  wire [31:0] pc, prox_pc;
  wire [31:0] instr;
  wire alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch;
  wire [1:0] alu_op;
  wire [4:0] rs1 = instr[19:15];
  wire [4:0] rs2 = instr[24:20];
  wire [4:0] rd = instr[11:7];
  wire [31:0] r1, r2;
  wire [31:0] imm;
  wire [31:0] b_entrada;
  wire [31:0] alu_res;
  wire zero;
  wire [3:0] cod_ula;
  wire [31:0] dado_mem;
  wire [31:0] dado_reg;
  wire [31:0] pc_mais4, pc_alvo;

  reg_pc u_pc(prox_pc, clk, rst, pc);
  rom_instr u_instr(pc[9:2], instr);
  unidade_controle u_ctrl(instr[6:0], alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op);
  registrador_geral u_regs(clk, rs1, rs2, rd, reg_write, dado_reg, r1, r2);
  extensor_imediato u_imm(instr, imm);
  controlador_ula u_ula_ctrl(instr[31:25], instr[14:12], alu_op, cod_ula);
  unidade_ula u_ula(r1, b_entrada, cod_ula, alu_res, zero);
  ram_dados u_dados(alu_res, clk, r2, mem_write, mem_read, dado_mem);

  assign b_entrada = alu_src ? imm : r2;
  assign dado_reg = mem_to_reg ? dado_mem : alu_res;
  assign pc_mais4 = pc + 4;
  assign pc_alvo  = pc + imm;
  assign prox_pc  = (branch && zero) ? pc_alvo : pc_mais4;
endmodule
