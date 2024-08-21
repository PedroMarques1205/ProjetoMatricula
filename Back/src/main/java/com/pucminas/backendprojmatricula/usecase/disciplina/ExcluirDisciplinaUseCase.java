package com.pucminas.backendprojmatricula.usecase.disciplina;

import com.pucminas.backendprojmatricula.core.disciplina.DisciplinaService;
import com.pucminas.backendprojmatricula.model.Disciplina;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ExcluirDisciplinaUseCase {

    @Autowired
    DisciplinaService disciplinaService;

    public Disciplina excluirDisciplina(Long id) {
        Disciplina disciplina = disciplinaService.obterDisciplina(id);
        disciplinaService.deletarDisciplina(id);
        return disciplina;
    }
}
