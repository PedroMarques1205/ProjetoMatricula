package com.pucminas.backendprojmatricula.core.disciplinaslecionadas;

import com.pucminas.backendprojmatricula.dataprovider.disciplina.IDisciplinaRepository;
import com.pucminas.backendprojmatricula.dataprovider.disciplinaslecionadas.IDisciplinasLecionadasRepository;
import com.pucminas.backendprojmatricula.dataprovider.usuario.IUsuarioRepository;
import com.pucminas.backendprojmatricula.model.Disciplina;
import com.pucminas.backendprojmatricula.model.DisciplinasLecionadas;
import com.pucminas.backendprojmatricula.model.Matricula;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class DisciplinasLecionadasService {
    @Autowired
    IDisciplinaRepository disciplinaRepository;

    @Autowired
    IDisciplinasLecionadasRepository disciplinasLecionadasRepository;

    @Autowired
    IUsuarioRepository usuarioRepository;


    public DisciplinasLecionadas ligaDisciplinaParaProfessor(String matricula,
                                                             String nomeDisciplina) {

        Usuario professor = usuarioRepository.findById(matricula).isPresent() ? usuarioRepository.findById(matricula).get() : null;
        Disciplina disciplina = disciplinaRepository.findByNome(nomeDisciplina);

        DisciplinasLecionadas disciplinasLecionadas = new DisciplinasLecionadas();
        disciplinasLecionadas.setDisciplinaLecionada(disciplina);
        disciplinasLecionadas.setProfessorDaDisciplina(professor);
        return disciplinasLecionadasRepository.save(disciplinasLecionadas);
    }

    public List<Disciplina> obterDisciplinasLecionadasPorProfessor(String matricula) {
        Usuario professor = usuarioRepository.findById(matricula).isPresent() ? usuarioRepository.findById(matricula).get() : null;
        List<DisciplinasLecionadas> disciplinasLecionadas = disciplinasLecionadasRepository.findByProfessorDaDisciplina(professor);

        List<Disciplina> disciplinas = disciplinasLecionadas.stream()
                .map(DisciplinasLecionadas::getDisciplinaLecionada)
                .filter(Objects::nonNull)
                .distinct()
                .toList();

        return disciplinas;
    }
}
