package com.pucminas.backendprojmatricula.usecase.curso;

import com.pucminas.backendprojmatricula.core.curso.CursoService;
import com.pucminas.backendprojmatricula.model.Curso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SalvarCursoUseCase {
    @Autowired
    CursoService cursoService;

    public Curso salvarCurso(Curso curso) {
        return cursoService.salvaCurso(curso);
    }
}
