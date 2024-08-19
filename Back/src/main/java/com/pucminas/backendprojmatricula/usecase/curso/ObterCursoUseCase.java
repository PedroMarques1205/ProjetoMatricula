package com.pucminas.backendprojmatricula.usecase.curso;

import com.pucminas.backendprojmatricula.core.curso.CursoService;
import com.pucminas.backendprojmatricula.model.Curso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class ObterCursoUseCase {

    @Autowired
    CursoService cursoService;

    public Optional<Curso> obterCurso(Long id) {
        return cursoService.buscaCurso(id);
    }

    public List<Curso> obterCursos() {
        return cursoService.buscaTodosCursos();
    }
}
