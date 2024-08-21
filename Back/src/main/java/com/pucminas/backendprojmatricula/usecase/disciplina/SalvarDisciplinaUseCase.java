package com.pucminas.backendprojmatricula.usecase.disciplina;

import com.pucminas.backendprojmatricula.core.disciplina.DisciplinaService;
import com.pucminas.backendprojmatricula.model.Disciplina;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SalvarDisciplinaUseCase {

    @Autowired
    DisciplinaService disciplinaService;

    public Disciplina salvarDisciplina(Disciplina disciplina) {
        return disciplinaService.salvarDisciplina(disciplina);
    }
}



