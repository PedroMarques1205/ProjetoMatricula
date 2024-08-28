package com.pucminas.backendprojmatricula.usecase.alunosmatriculadosporcurso;

import com.pucminas.backendprojmatricula.core.alunosmatriculadosporcurso.AlunosMatriculadosPorCursoService;
import com.pucminas.backendprojmatricula.model.Curso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ObterCursoPorAlunoUseCase {
    @Autowired
    AlunosMatriculadosPorCursoService alunosMatriculadosPorCursoService;

    public Curso obterCursoPorAluno(String matricula) {
        return alunosMatriculadosPorCursoService.obterCursoAluno(matricula);
    }
}
