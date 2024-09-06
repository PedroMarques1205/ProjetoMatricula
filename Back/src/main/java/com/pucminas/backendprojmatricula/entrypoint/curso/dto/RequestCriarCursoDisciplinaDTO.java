package com.pucminas.backendprojmatricula.entrypoint.curso.dto;

import com.pucminas.backendprojmatricula.core.curso.dto.DisciplinaSemestreDTO;
import com.pucminas.backendprojmatricula.model.Curso;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class RequestCriarCursoDisciplinaDTO {
    Curso curso;
    List<DisciplinaSemestreDTO> disciplinaComSemestre;
}
