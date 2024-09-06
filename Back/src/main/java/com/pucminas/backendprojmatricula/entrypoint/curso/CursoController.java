package com.pucminas.backendprojmatricula.entrypoint.curso;

import com.pucminas.backendprojmatricula.common.mapper.Mapper;
import com.pucminas.backendprojmatricula.core.curso.dto.DisciplinaSemestreDTO;
import com.pucminas.backendprojmatricula.entrypoint.curso.dto.CursoDTO;
import com.pucminas.backendprojmatricula.entrypoint.curso.dto.RequestCriarCursoDisciplinaDTO;
import com.pucminas.backendprojmatricula.entrypoint.curso.dto.RequestEditarCursoDTO;
import com.pucminas.backendprojmatricula.model.Curso;
import com.pucminas.backendprojmatricula.model.DisciplinasDoCurso;
import com.pucminas.backendprojmatricula.usecase.curso.DeletarCursoUseCase;
import com.pucminas.backendprojmatricula.usecase.curso.EditarCursoUseCase;
import com.pucminas.backendprojmatricula.usecase.curso.ObterCursoUseCase;
import com.pucminas.backendprojmatricula.usecase.curso.SalvarCursoUseCase;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

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
    public ResponseEntity<Optional<Curso>> buscarCurso(@RequestParam Long id) {
        return ResponseEntity.ok(obterCursoUseCase.obterCurso(id));
    }

    @GetMapping("/obterTodosOsCursos")
    public ResponseEntity<List<Curso>> buscarTodosCursos() {
        return ResponseEntity.ok(obterCursoUseCase.obterCursos());
    }

    @DeleteMapping("/deletaCurso")
    public ResponseEntity<CursoDTO> deletarCurso(@RequestParam Long curso) {
        return ResponseEntity.ok(mapper.generalMapper(deletarCursoUseCase.deletarCurso(curso),
                CursoDTO.class));
    }

    @PutMapping("/editaCurso")
    public ResponseEntity<Curso> deletarCurso(@RequestBody RequestEditarCursoDTO curso) {
        return ResponseEntity.ok(editarCursoUseCase.editarCurso(curso));
    }

    @PostMapping("/novoCursoComDisciplinas")
    public ResponseEntity<List<DisciplinasDoCurso>> salvarNovoCursoComDisciplinas(@RequestBody @Valid RequestCriarCursoDisciplinaDTO request) {
        return ResponseEntity.ok(salvarCursoUseCase.salvarCursoComDIsciplina(request.getCurso(),request.getDisciplinaComSemestre()));
    }
}
