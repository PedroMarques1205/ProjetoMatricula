package com.pucminas.backendprojmatricula.entrypoint.alunosmatriculadosporcurso;

import com.pucminas.backendprojmatricula.model.AlunosMatriculadosPorCurso;
import com.pucminas.backendprojmatricula.model.Curso;
import com.pucminas.backendprojmatricula.usecase.alunosmatriculadosporcurso.MatricularAlunoEmUmCursoUseCase;
import com.pucminas.backendprojmatricula.usecase.alunosmatriculadosporcurso.ObterCursoPorAlunoUseCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/alunosPorCurso")
public class AlunosMatriculadosPorCursoController {
    @Autowired
    MatricularAlunoEmUmCursoUseCase matricularAlunoEmUmCursoUseCase;

    @Autowired
    ObterCursoPorAlunoUseCase obterCursoPorAlunoUseCase;

    @PostMapping("/matricularAlunoEmUmCurso")
    public ResponseEntity<AlunosMatriculadosPorCurso> matricular(String matriculaAluno, String nomeCurso) {
        return ResponseEntity.ok(matricularAlunoEmUmCursoUseCase.matricularAlunoCurso(matriculaAluno,nomeCurso));
    }

    @GetMapping("/obterCursoPorAluno")
    public ResponseEntity<Curso> matricular(String matriculaAluno) {
        return ResponseEntity.ok(obterCursoPorAlunoUseCase.obterCursoPorAluno(matriculaAluno));
    }
}
