package com.pucminas.backendprojmatricula.entrypoint.disciplina.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
public class DisciplinaDTO {

    @NotEmpty
    private String nome;

    @NotEmpty
    private String descricao;

    private boolean ativa = true;

    private int numeroAlunos = 0;
}
