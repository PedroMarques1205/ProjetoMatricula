package com.pucminas.backendprojmatricula.core.alunosmatriculadosporcurso;

import com.pucminas.backendprojmatricula.dataprovider.alunosmatriculadosporcurso.IAlunosMatriculadosPorCursoRepository;
import com.pucminas.backendprojmatricula.dataprovider.curso.ICursoRepository;
import com.pucminas.backendprojmatricula.dataprovider.usuario.IUsuarioRepository;
import com.pucminas.backendprojmatricula.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class AlunosMatriculadosPorCursoService {
    @Autowired
    IAlunosMatriculadosPorCursoRepository alunosMatriculadosPorCursoRepository;

    @Autowired
    IUsuarioRepository usuarioRepository;

    @Autowired
    ICursoRepository cursoRepository;

    public AlunosMatriculadosPorCurso matriculaAlunoEmUmCurso(String matricula,
                                                                  String nomeCurso) {

        Usuario aluno = usuarioRepository.findById(matricula).isPresent() ? usuarioRepository.findById(matricula).get() : null;
        Curso curso = cursoRepository.findByNome(nomeCurso);

        AlunosMatriculadosPorCurso alunosMatriculadosPorCurso = new AlunosMatriculadosPorCurso();
        alunosMatriculadosPorCurso.setCurso(curso);
        alunosMatriculadosPorCurso.setAluno(aluno);
        return alunosMatriculadosPorCursoRepository.save(alunosMatriculadosPorCurso);
    }

    public Curso obterCursoAluno(String matricula) {
        Usuario aluno = usuarioRepository.findById(matricula).isPresent() ? usuarioRepository.findById(matricula).get() : null;
        List<AlunosMatriculadosPorCurso> disciplinasLecionadas = alunosMatriculadosPorCursoRepository.findByAluno(aluno);

        List<Curso> cursos = disciplinasLecionadas.stream()
                .map(AlunosMatriculadosPorCurso::getCurso)
                .filter(Objects::nonNull)
                .distinct()
                .toList();

        return cursos.getFirst();
    }
}
