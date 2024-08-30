package com.pucminas.backendprojmatricula.entrypoint.disciplinasdocurso;

import com.pucminas.backendprojmatricula.model.DisciplinasDoCurso;
import com.pucminas.backendprojmatricula.usecase.disciplinasdocurso.AssociarDisciplinaCursoUseCase;
import com.pucminas.backendprojmatricula.usecase.disciplinasdocurso.GerarCurriculoUseCase;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/disciplinascurso")
public class DisciplinasDoCursoController {

    @Autowired
    AssociarDisciplinaCursoUseCase associarDisciplinaCursoUseCase;

    @Autowired
    GerarCurriculoUseCase gerarCurriculoUseCase;

    @PostMapping("/associaDisciplinaCurso")
    public ResponseEntity<Void> associa(Long curso, Long disciplina, Integer semestre) {
        associarDisciplinaCursoUseCase.associarDisciplinasCurso(curso, disciplina, semestre);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/gerarCurriculoDoCurso")
    public ResponseEntity<List<DisciplinasDoCurso>> gerarCurriculoDoCurso(@RequestParam @Valid Long idCurso) {
        return ResponseEntity.ok(gerarCurriculoUseCase.gerarCurriculo(idCurso));
    }
}
