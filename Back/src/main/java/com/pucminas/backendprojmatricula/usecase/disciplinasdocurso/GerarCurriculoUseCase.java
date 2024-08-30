package com.pucminas.backendprojmatricula.usecase.disciplinasdocurso;

import com.pucminas.backendprojmatricula.core.disciplinasdocurso.DisciplinasDoCursoService;
import com.pucminas.backendprojmatricula.model.DisciplinasDoCurso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class GerarCurriculoUseCase {
    @Autowired
    DisciplinasDoCursoService disciplinasDoCursoService;

    public List<DisciplinasDoCurso> gerarCurriculo(Long idCurso) {
        return disciplinasDoCursoService.gerarCurriculo(idCurso);
    }
}
