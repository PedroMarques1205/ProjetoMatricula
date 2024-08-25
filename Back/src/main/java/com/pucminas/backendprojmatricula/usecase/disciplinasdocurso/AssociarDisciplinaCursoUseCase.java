package com.pucminas.backendprojmatricula.usecase.disciplinasdocurso;

import com.pucminas.backendprojmatricula.core.disciplina.DisciplinaService;
import com.pucminas.backendprojmatricula.core.disciplinasdocurso.DisciplinasDoCursoService;
import com.pucminas.backendprojmatricula.model.Curso;
import com.pucminas.backendprojmatricula.model.Disciplina;
import com.pucminas.backendprojmatricula.model.DisciplinasDoCurso;
import com.pucminas.backendprojmatricula.model.Semestre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AssociarDisciplinaCursoUseCase {
    @Autowired
    DisciplinasDoCursoService disciplinasDoCursoService;

    public void associarDisciplinasCurso(Long curso, Long disciplina, Integer semestreOrdinal) {
        disciplinasDoCursoService.associarDisciplinasParaCurso(curso, disciplina,semestreOrdinal);
    }
}
