package com.pucminas.backendprojmatricula.usecase.disciplina;

import com.pucminas.backendprojmatricula.core.disciplina.DisciplinaService;
import com.pucminas.backendprojmatricula.core.matricula.MatriculaService;
import com.pucminas.backendprojmatricula.model.Disciplina;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ObterDisciplinaUseCase {

    @Autowired
    DisciplinaService disciplinaService;

    @Autowired
    MatriculaService matriculaService;

    public Disciplina obterDisciplina(Long id) {
        return disciplinaService.obterDisciplina(id);
    }

    public List<Disciplina> obterDisciplinas() {
        return disciplinaService.obterTodasDisciplinas();
    }

    public List<Disciplina> obterDisciplinasPorMatricula(String matricula) {
        return matriculaService.obterDisciplinasPorAluno(matricula);
    }
}
