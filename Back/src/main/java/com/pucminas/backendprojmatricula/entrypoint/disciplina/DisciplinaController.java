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
    public ResponseEntity<DisciplinaDTO> salvarNovaDisciplina(@RequestBody @Valid Disciplina disciplina) {
        return ResponseEntity.ok(mapper.generalMapper(salvarDisciplinaUseCase.salvarDisciplina(disciplina),
                DisciplinaDTO.class));
    }

    @GetMapping("/buscarDisciplina")
    public ResponseEntity<DisciplinaDTO> buscarDisciplina(@RequestParam Long id) {
        return ResponseEntity.ok(mapper.generalMapper(obterDisciplinaUseCase.obterDisciplina(id),
                DisciplinaDTO.class));
    }

    @GetMapping("/obterTodasAsDisciplinas")
    public ResponseEntity<List<DisciplinaDTO>> buscarTodasDisciplinas() {
        return ResponseEntity.ok(mapper.mapCollection(obterDisciplinaUseCase.obterDisciplinas(),
                DisciplinaDTO.class));
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
}
