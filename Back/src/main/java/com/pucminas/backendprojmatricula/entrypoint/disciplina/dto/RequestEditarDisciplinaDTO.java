package com.pucminas.backendprojmatricula.entrypoint.disciplina.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RequestEditarDisciplinaDTO {
    private Long id;
    private String nome;
    private String descricao;
    private boolean ativa;
}
