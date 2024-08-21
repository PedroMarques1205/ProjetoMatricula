package com.pucminas.backendprojmatricula.usecase.disciplina;

import com.pucminas.backendprojmatricula.core.disciplina.DisciplinaService;
import com.pucminas.backendprojmatricula.model.Disciplina;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ObterDisciplinaUseCase {

    @Autowired
    DisciplinaService disciplinaService;

    public Disciplina obterDisciplina(Long id) {
        return disciplinaService.obterDisciplina(id);
    }

    public List<Disciplina> obterDisciplinas() {
        return disciplinaService.obterTodasDisciplinas();
    }
}
