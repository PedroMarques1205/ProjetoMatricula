package com.pucminas.backendprojmatricula.core.matricula;

import com.pucminas.backendprojmatricula.dataprovider.disciplina.IDisciplinaRepository;
import com.pucminas.backendprojmatricula.dataprovider.matricula.IMatriculaRepository;
import com.pucminas.backendprojmatricula.dataprovider.usuario.IUsuarioRepository;
import com.pucminas.backendprojmatricula.model.Disciplina;
import com.pucminas.backendprojmatricula.model.Matricula;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class MatriculaService {
    @Autowired
    IMatriculaRepository matriculaRepository;

    @Autowired
    IDisciplinaRepository disciplinaRepository;

    @Autowired
    IUsuarioRepository usuarioRepository;

    public Matricula matricularAlunoEmUmaDisciplina(String matricula, String nomeDisciplina) {
        Usuario aluno = usuarioRepository.findById(matricula).isPresent() ? usuarioRepository.findById(matricula).get() : null;
        Disciplina disciplina = disciplinaRepository.findByNome(nomeDisciplina);

        Matricula matriculaAluno = new Matricula();
        matriculaAluno.setAluno(aluno);
        matriculaAluno.setDisciplina(disciplina);
        return matriculaRepository.save(matriculaAluno);
    }

    public List<Disciplina> obterDisciplinasPorAluno(String matricula) {
        Usuario aluno = usuarioRepository.findById(matricula).isPresent() ? usuarioRepository.findById(matricula).get() : null;
        List<Matricula> matriculas = matriculaRepository.findMatriculaByAluno(aluno);
        List<Disciplina> disciplinas = matriculas.stream()
                .map(Matricula::getDisciplina)
                .filter(Objects::nonNull)
                .distinct()
                .toList();
        return disciplinas;
    }

    public List<Usuario> obterAlunosPorDisciplina(String nomeDisciplina) {
        Disciplina disciplina = disciplinaRepository.findByNome(nomeDisciplina);
        List<Matricula> matriculas = matriculaRepository.findMatriculaByDisciplina(disciplina);
        List<Usuario> alunos = matriculas.stream()
                .map(Matricula::getAluno)
                .filter(Objects::nonNull)
                .distinct()
                .toList();
        return alunos;
    }
}
