package com.pucminas.backendprojmatricula.core.curso.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DisciplinaSemestreDTO {
    private Long idDisciplina;
    private Integer ordinalSemestre;
}
