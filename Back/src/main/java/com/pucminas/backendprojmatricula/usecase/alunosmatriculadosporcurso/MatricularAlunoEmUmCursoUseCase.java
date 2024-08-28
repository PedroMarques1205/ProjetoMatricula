package com.pucminas.backendprojmatricula.usecase.alunosmatriculadosporcurso;

import com.pucminas.backendprojmatricula.core.alunosmatriculadosporcurso.AlunosMatriculadosPorCursoService;
import com.pucminas.backendprojmatricula.model.AlunosMatriculadosPorCurso;
import com.pucminas.backendprojmatricula.model.Curso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MatricularAlunoEmUmCursoUseCase {
    @Autowired
    AlunosMatriculadosPorCursoService alunosMatriculadosPorCursoService;

    public AlunosMatriculadosPorCurso matricularAlunoCurso(String matricula, String curso) {
        return alunosMatriculadosPorCursoService.matriculaAlunoEmUmCurso(matricula,curso);
    }
}
