package com.pucminas.backendprojmatricula.entrypoint.curso.dto;

import jakarta.persistence.Id;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class CursoDTO {

    private String nome;

    private String descricao;

    private boolean ativo = true;
}
