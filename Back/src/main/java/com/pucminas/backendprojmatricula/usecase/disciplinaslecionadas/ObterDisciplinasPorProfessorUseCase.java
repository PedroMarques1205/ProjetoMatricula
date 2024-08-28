package com.pucminas.backendprojmatricula.usecase.disciplinaslecionadas;

import com.pucminas.backendprojmatricula.core.disciplinaslecionadas.DisciplinasLecionadasService;
import com.pucminas.backendprojmatricula.model.Disciplina;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ObterDisciplinasPorProfessorUseCase {
    @Autowired
    DisciplinasLecionadasService disciplinasLecionadasService;

    public List<Disciplina> obterDisciplinasPorProfessor(String matricula) {
        return disciplinasLecionadasService.obterDisciplinasLecionadasPorProfessor(matricula);
    }
}
