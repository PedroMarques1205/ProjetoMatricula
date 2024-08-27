package com.pucminas.backendprojmatricula.usecase.matricula;

import com.pucminas.backendprojmatricula.core.matricula.MatriculaService;
import com.pucminas.backendprojmatricula.model.Matricula;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MatricularAlunoEmDisciplinaUseCase {
    @Autowired
    MatriculaService service;

    public Matricula matricularAlunoEmDisciplina(String matricula, String disciplina) {
        return service.matricularAlunoEmUmaDisciplina(matricula, disciplina);
    }
}
