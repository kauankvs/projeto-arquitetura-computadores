module rom_instr(endereco, instr);
  input wire [7:0] endereco;
  output wire [31:0] instr;

  reg [31:0] mem[0:255];

  assign instr = mem[endereco];

  initial begin
    $readmemh("instructions.txt", mem, 0, 3);
  end
endmodule