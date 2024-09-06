package com.pucminas.backendprojmatricula.core.curso;

import com.pucminas.backendprojmatricula.core.curso.dto.DisciplinaSemestreDTO;
import com.pucminas.backendprojmatricula.dataprovider.curso.ICursoRepository;
import com.pucminas.backendprojmatricula.dataprovider.disciplina.IDisciplinaRepository;
import com.pucminas.backendprojmatricula.dataprovider.disciplinasdocurso.IDisciplinasDoCursoRepository;
import com.pucminas.backendprojmatricula.dataprovider.semestre.ISemestreRepository;
import com.pucminas.backendprojmatricula.entrypoint.curso.dto.RequestEditarCursoDTO;
import com.pucminas.backendprojmatricula.model.Curso;
import com.pucminas.backendprojmatricula.model.Disciplina;
import com.pucminas.backendprojmatricula.model.DisciplinasDoCurso;
import com.pucminas.backendprojmatricula.model.Semestre;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CursoService {

    @Autowired
    ICursoRepository cursoRepository;

    @Autowired
    ISemestreRepository semestreRepository;

    @Autowired
    IDisciplinasDoCursoRepository DisciplinasDoCursoRepository;

    @Autowired
    IDisciplinaRepository disciplinaRepository;


    public Optional<Curso> buscaCurso(Long id) {
        return cursoRepository.findById(id);
    }

    public List<Curso> buscaTodosCursos() {
        return cursoRepository.findAll().stream()
                .filter(Curso::isAtivo)
                .toList();
    }

    public Curso salvaCurso(Curso curso) {
        cursoRepository.save(curso);
        for(int i = 0; i < curso.getNumSemestres(); i++){
            Semestre semestre = new Semestre();
            semestre.setId(Semestre.SemestreId.builder()
                            .curso(curso)
                            .ordinal(i+1)
                    .build());
            semestreRepository.save(semestre);
        }
        return curso;
    }

    public Curso deletarCurso(Long id) {
        if(cursoRepository.findById(id).isPresent()) {
            Curso Curso = cursoRepository.findById(id).get();
            Curso.setAtivo(false);
            cursoRepository.save(Curso);

            return Curso;
        }
        return null;
    }

    public Curso editarCurso(RequestEditarCursoDTO params) {
        if(cursoRepository.findById(params.getId()).isPresent()) {
            Curso curso = cursoRepository.findById(params.getId()).get();

            if(params.getNome()!=null)
                curso.setNome(params.getNome());
            if(params.getDescricao()!=null)
                curso.setDescricao(params.getDescricao());

            cursoRepository.save(curso);

            return curso;
        }
        return null;
    }

    public List<DisciplinasDoCurso> associarDisciplinasParaCurso(Curso curso, List<DisciplinaSemestreDTO> disciplinaSemestreDTO) {
        Curso cursoSalvo = salvaCurso(curso);
        cursoSalvo = cursoRepository.findCursoWithMaxId();
        List<DisciplinasDoCurso> retorno = new ArrayList<>();
        for (DisciplinaSemestreDTO item : disciplinaSemestreDTO) {
            Long disciplinaId = item.getIdDisciplina();
            Integer semestreOrdinal = item.getOrdinalSemestre();
            Disciplina disciplina = disciplinaRepository.findById(disciplinaId).isPresent() ? disciplinaRepository.findById(disciplinaId).get() : null;
            Semestre semestre = semestreRepository.findById(Semestre.SemestreId.builder()
                    .ordinal(semestreOrdinal)
                    .curso(cursoSalvo)
                    .build()).isPresent() ? semestreRepository.findById(Semestre.SemestreId.builder()
                    .ordinal(semestreOrdinal)
                    .curso(cursoSalvo)
                    .build()).get() : null;

            DisciplinasDoCurso disciplinasDoCurso = new DisciplinasDoCurso();
            disciplinasDoCurso.setCurso(cursoSalvo);
            disciplinasDoCurso.setDisciplina(disciplina);
            disciplinasDoCurso.setSemestre(semestre);

            retorno.add(DisciplinasDoCursoRepository.save(disciplinasDoCurso));
        }
        return retorno;
    }
}
