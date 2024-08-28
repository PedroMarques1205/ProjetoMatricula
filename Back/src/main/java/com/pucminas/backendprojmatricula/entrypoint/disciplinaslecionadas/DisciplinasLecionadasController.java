package com.pucminas.backendprojmatricula.entrypoint.disciplinaslecionadas;

import com.pucminas.backendprojmatricula.model.Disciplina;
import com.pucminas.backendprojmatricula.model.DisciplinasLecionadas;
import com.pucminas.backendprojmatricula.model.Matricula;
import com.pucminas.backendprojmatricula.usecase.disciplinaslecionadas.LigarProfessorParaDisciplinaUseCase;
import com.pucminas.backendprojmatricula.usecase.disciplinaslecionadas.ObterDisciplinasPorProfessorUseCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/ProfessorDisciplina")
public class DisciplinasLecionadasController {
    @Autowired
    LigarProfessorParaDisciplinaUseCase ligarProfessorParaDisciplinaUseCase;

    @Autowired
    ObterDisciplinasPorProfessorUseCase obterDisciplinasPorProfessorUseCase;

    @PostMapping("/ligarProfessorEmDisciplina")
    public ResponseEntity<DisciplinasLecionadas> professrEmDisciplina(@RequestParam String matriculaAluno,
                                                                             @RequestParam String nomeDisciplina) {

        return ResponseEntity.ok(ligarProfessorParaDisciplinaUseCase.ligarProfessorParaDisciplina(matriculaAluno, nomeDisciplina));
    }

    @GetMapping("obterDisciplinasPorProfessor")
    public ResponseEntity<List<Disciplina>> obterDisciplinasPorProf(@RequestParam String matriculaProfessor) {
        return ResponseEntity.ok(obterDisciplinasPorProfessorUseCase.obterDisciplinasPorProfessor(matriculaProfessor));
    }
}
