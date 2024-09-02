package com.pucminas.backendprojmatricula.usecase.curso;

import com.pucminas.backendprojmatricula.core.curso.CursoService;
import com.pucminas.backendprojmatricula.core.curso.dto.DisciplinaSemestreDTO;
import com.pucminas.backendprojmatricula.model.Curso;
import com.pucminas.backendprojmatricula.model.DisciplinasDoCurso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SalvarCursoUseCase {
    @Autowired
    CursoService cursoService;

    public Curso salvarCurso(Curso curso) {
        return cursoService.salvaCurso(curso);
    }

    public List<DisciplinasDoCurso> salvarCursoComDIsciplina(Curso curso, List<DisciplinaSemestreDTO> disciplinasDoCurso) {
        return cursoService.associarDisciplinasParaCurso(curso,disciplinasDoCurso);
    }
}
