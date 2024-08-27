package com.pucminas.backendprojmatricula.entrypoint.matricula;

import com.pucminas.backendprojmatricula.model.Matricula;
import com.pucminas.backendprojmatricula.usecase.matricula.MatricularAlunoEmDisciplinaUseCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/matricula")
public class MatriculaController {
    @Autowired
    MatricularAlunoEmDisciplinaUseCase matricularAlunoEmDisciplinaUseCase;

    @PostMapping("/matricularAlunoEmDisciplina")
    public ResponseEntity<Matricula> matricularAlunoEmDisciplina(@RequestParam String matriculaAluno,
                                                                 @RequestParam String nomeDisciplina) {

        return ResponseEntity.ok(matricularAlunoEmDisciplinaUseCase.matricularAlunoEmDisciplina(matriculaAluno, nomeDisciplina));
    }
}
