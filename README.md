# Processador RISC-V de Ciclo Único em Verilog

URL: https://github.com/kauankvs/projeto-arquitetura-computadores

## Introdução

Este projeto implementa um processador de ciclo único baseado na arquitetura RISC-V utilizando Verilog.

Todos os estágios da execução (busca, decodificação, execução, acesso à memória e escrita) ocorrem em um único ciclo de clock, conforme o modelo didático de processadores RISC-V.

## Objetivos

O objetivo deste projeto é implementar um datapath completo com suporte às principais instruções do conjunto base da arquitetura RISC-V, integrando de forma funcional os módulos essenciais, como banco de registradores, unidade lógica e aritmética (ULA), memórias e unidade de controle. 
A implementação é validada por meio de simulações utilizando as ferramentas Icarus Verilog e GTKWave.

## Arquitetura Geral

O processador possui arquitetura de ciclo único. Todos os módulos são sincronizados por clock e executam suas funções combinacionais ou sequenciais em um único ciclo.
A lógica de controle e o caminho de dados estão conectados via sinais internos.

## Módulos Implementados

### `unidade_ula.v`
Executa `add`, `sub`, `and`, `or`. Gera uma flag `z` usada por instruções de desvio (`beq`).

### `unidade_controle.v`
Gera sinais como `alu_src`, `mem_to_reg`, `reg_write`, `mem_read`, `branch`, com base no opcode da instrução.

### `registrador_geral.v`
Banco de 32 registradores de 32 bits. Suporta leitura dupla e escrita simples com controle.

### `ram_dados.v`
Memória de dados com 1024 palavras de 32 bits. Permite leitura/escrita controladas.

### `rom_instr.v`
Memória de instruções com 256 posições. As instruções são carregadas via `$readmemh`.

### `reg_pc.v`
Registrador de 32 bits para o PC. Atualizado a cada clock ou reiniciado por `reset`.

### `extensor_imediato.v`
Extrai e estende imediatos para tipos I, S e B (sinalizados corretamente).

### `controlador_ula.v`
Define qual operação a ULA deve executar com base em `alu_op`, `f3`, `f7`.

### `datapath.v`
Integra todos os módulos, executando as instruções em ciclo único.

### `testbench.v`
Teste simples criado como exemplo. Inicializa o clock, aplica `reset`, executa a simulação e gera o `dump.vcd` para análise.

