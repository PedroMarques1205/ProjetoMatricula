package com.pucminas.backendprojmatricula.entrypoint.curso;

import com.pucminas.backendprojmatricula.common.mapper.Mapper;
import com.pucminas.backendprojmatricula.entrypoint.curso.dto.CursoDTO;
import com.pucminas.backendprojmatricula.entrypoint.curso.dto.RequestEditarCursoDTO;
import com.pucminas.backendprojmatricula.model.Curso;
import com.pucminas.backendprojmatricula.usecase.curso.DeletarCursoUseCase;
import com.pucminas.backendprojmatricula.usecase.curso.EditarCursoUseCase;
import com.pucminas.backendprojmatricula.usecase.curso.ObterCursoUseCase;
import com.pucminas.backendprojmatricula.usecase.curso.SalvarCursoUseCase;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/curso")
public class CursoController {

    @Autowired
    ObterCursoUseCase obterCursoUseCase;

    @Autowired
    EditarCursoUseCase editarCursoUseCase;

    @Autowired
    DeletarCursoUseCase deletarCursoUseCase;

    @Autowired
    SalvarCursoUseCase salvarCursoUseCase;

    @Autowired
    Mapper mapper;


    @PostMapping("/novoCurso")
    public ResponseEntity<CursoDTO> salvarNovoCurso(@RequestBody @Valid Curso curso) {
        return ResponseEntity.ok(mapper.generalMapper(salvarCursoUseCase.salvarCurso(curso),
                CursoDTO.class));
    }

    @GetMapping("/buscarCurso")
    public ResponseEntity<CursoDTO> buscarCurso(@RequestParam Long id) {
        return ResponseEntity.ok(mapper.generalMapper(obterCursoUseCase.obterCurso(id),
                CursoDTO.class));
    }

    @GetMapping("/obterTodosOsCursos")
    public ResponseEntity<List<CursoDTO>> buscarTodosCursos() {
        return ResponseEntity.ok(mapper.mapCollection(obterCursoUseCase.obterCursos(),
                CursoDTO.class));
    }

    @DeleteMapping("/deletaCurso")
    public ResponseEntity<CursoDTO> deletarCurso(@RequestParam Long curso) {
        return ResponseEntity.ok(mapper.generalMapper(deletarCursoUseCase.deletarCurso(curso),
                CursoDTO.class));
    }

    @PutMapping("/editaCurso")
    public ResponseEntity<CursoDTO> deletarCurso(@RequestBody RequestEditarCursoDTO curso) {
        return ResponseEntity.ok(mapper.generalMapper(editarCursoUseCase.editarCurso(curso),
                CursoDTO.class));
    }
}
