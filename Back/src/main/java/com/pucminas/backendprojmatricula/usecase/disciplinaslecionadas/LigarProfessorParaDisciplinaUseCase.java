package com.pucminas.backendprojmatricula.usecase.disciplinaslecionadas;

import com.pucminas.backendprojmatricula.core.disciplinaslecionadas.DisciplinasLecionadasService;
import com.pucminas.backendprojmatricula.model.DisciplinasLecionadas;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LigarProfessorParaDisciplinaUseCase {
    @Autowired
    DisciplinasLecionadasService disciplinasLecionadasService;

    public DisciplinasLecionadas ligarProfessorParaDisciplina(String matricula, String disciplina) {
        return disciplinasLecionadasService.ligaDisciplinaParaProfessor(matricula,disciplina);
    }
}
