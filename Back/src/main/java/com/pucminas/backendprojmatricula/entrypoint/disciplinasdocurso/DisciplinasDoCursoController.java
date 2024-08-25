package com.pucminas.backendprojmatricula.entrypoint.disciplinasdocurso;

import com.pucminas.backendprojmatricula.model.Curso;
import com.pucminas.backendprojmatricula.model.Disciplina;
import com.pucminas.backendprojmatricula.model.Semestre;
import com.pucminas.backendprojmatricula.usecase.disciplinasdocurso.AssociarDisciplinaCursoUseCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/disciplinascurso")
public class DisciplinasDoCursoController {

    @Autowired
    AssociarDisciplinaCursoUseCase associarDisciplinaCursoUseCase;
    @PostMapping("/associaDisciplinaCurso")
    public ResponseEntity<Void> associa(Long curso, Long disciplina, Integer semestre) {
        associarDisciplinaCursoUseCase.associarDisciplinasCurso(curso, disciplina, semestre);
        return ResponseEntity.ok().build();
    }
}
