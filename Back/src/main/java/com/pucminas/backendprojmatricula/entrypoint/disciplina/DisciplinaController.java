package com.pucminas.backendprojmatricula.entrypoint.disciplina;

import com.pucminas.backendprojmatricula.common.mapper.Mapper;
import com.pucminas.backendprojmatricula.entrypoint.disciplina.dto.DisciplinaDTO;
import com.pucminas.backendprojmatricula.entrypoint.disciplina.dto.RequestEditarDisciplinaDTO;
import com.pucminas.backendprojmatricula.model.Disciplina;
import com.pucminas.backendprojmatricula.usecase.disciplina.ExcluirDisciplinaUseCase;
import com.pucminas.backendprojmatricula.usecase.disciplina.EditarDisciplinaUseCase;
import com.pucminas.backendprojmatricula.usecase.disciplina.ObterDisciplinaUseCase;
import com.pucminas.backendprojmatricula.usecase.disciplina.SalvarDisciplinaUseCase;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/Disciplina")
public class DisciplinaController {

    @Autowired
    ObterDisciplinaUseCase obterDisciplinaUseCase;

    @Autowired
    EditarDisciplinaUseCase editarDisciplinaUseCase;

    @Autowired
    ExcluirDisciplinaUseCase excluirDisciplinaUseCase;

    @Autowired
    SalvarDisciplinaUseCase salvarDisciplinaUseCase;

    @Autowired
    Mapper mapper;

    @PostMapping("/novaDisciplina")
    public ResponseEntity<Disciplina> salvarNovaDisciplina(@RequestBody @Valid Disciplina disciplina) {
        return ResponseEntity.ok(salvarDisciplinaUseCase.salvarDisciplina(disciplina));
    }

    @GetMapping("/buscarDisciplina")
    public ResponseEntity<Disciplina> buscarDisciplina(@RequestParam Long id) {
        return ResponseEntity.ok(obterDisciplinaUseCase.obterDisciplina(id));
    }

    @GetMapping("/obterTodasAsDisciplinas")
    public ResponseEntity<List<Disciplina>> buscarTodasDisciplinas() {
        return ResponseEntity.ok(obterDisciplinaUseCase.obterDisciplinas());
    }

    @DeleteMapping("/deletaDisciplina")
    public ResponseEntity<DisciplinaDTO> deletarDisciplina(@RequestParam Long id) {
        return ResponseEntity.ok(mapper.generalMapper(excluirDisciplinaUseCase.excluirDisciplina(id),
                DisciplinaDTO.class));
    }

    @PutMapping("/editaDisciplina")
    public ResponseEntity<DisciplinaDTO> editarDisciplina(@RequestBody @Valid RequestEditarDisciplinaDTO disciplina) {
        return ResponseEntity.ok(mapper.generalMapper(editarDisciplinaUseCase.editarDisciplina(disciplina),
                DisciplinaDTO.class));
    }

    @GetMapping("/obterDisciplinasPorEstudante")
    public ResponseEntity<List<Disciplina>> buscarDisciplinas(String matriculaEstudante) {
        return ResponseEntity.ok(obterDisciplinaUseCase.obterDisciplinasPorMatricula(matriculaEstudante));
    }
}
