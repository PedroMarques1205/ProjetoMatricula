package com.pucminas.backendprojmatricula.entrypoint.curso.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class RequestEditarCursoDTO {
    private Long id;
    private String nome;
    private String Descricao;
}
