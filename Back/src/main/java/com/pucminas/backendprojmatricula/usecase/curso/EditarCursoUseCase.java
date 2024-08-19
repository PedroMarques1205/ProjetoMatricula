package com.pucminas.backendprojmatricula.usecase.curso;

import com.pucminas.backendprojmatricula.core.curso.CursoService;
import com.pucminas.backendprojmatricula.entrypoint.curso.dto.RequestEditarCursoDTO;
import com.pucminas.backendprojmatricula.model.Curso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EditarCursoUseCase {

    @Autowired
    CursoService cursoService;

    public Curso editarCurso(RequestEditarCursoDTO curso) {
        return cursoService.editarCurso(curso);
    }
}
