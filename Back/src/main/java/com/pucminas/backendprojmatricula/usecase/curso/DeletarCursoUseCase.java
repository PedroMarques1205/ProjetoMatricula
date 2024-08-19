package com.pucminas.backendprojmatricula.usecase.curso;

import com.pucminas.backendprojmatricula.core.curso.CursoService;
import com.pucminas.backendprojmatricula.model.Curso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DeletarCursoUseCase {

    @Autowired
    CursoService cursoService;

    public Curso deletarCurso(Long cursoId) {
        return cursoService.deletarCurso(cursoId);
    }
}
