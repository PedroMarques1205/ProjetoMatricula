package com.pucminas.backendprojmatricula.core.disciplinasdocurso;

import com.pucminas.backendprojmatricula.dataprovider.curso.ICursoRepository;
import com.pucminas.backendprojmatricula.dataprovider.disciplina.IDisciplinaRepository;
import com.pucminas.backendprojmatricula.dataprovider.disciplinasdocurso.IDisciplinasDoCursoRepository;
import com.pucminas.backendprojmatricula.dataprovider.semestre.ISemestreRepository;
import com.pucminas.backendprojmatricula.model.Curso;
import com.pucminas.backendprojmatricula.model.Disciplina;
import com.pucminas.backendprojmatricula.model.DisciplinasDoCurso;
import com.pucminas.backendprojmatricula.model.Semestre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DisciplinasDoCursoService {
    @Autowired
    IDisciplinasDoCursoRepository DisciplinasDoCursoRepository;

    @Autowired
    ISemestreRepository semestreRepository;

    @Autowired
    IDisciplinaRepository disciplinaRepository;

    @Autowired
    ICursoRepository cursoRepository;

    public void associarDisciplinasParaCurso(Long cursoId, Long disciplinaId, Integer semestreOrdinal) {
        Curso curso = cursoRepository.findById(cursoId).isPresent() ? cursoRepository.findById(cursoId).get() : null;
        Disciplina disciplina = disciplinaRepository.findById(disciplinaId).isPresent() ? disciplinaRepository.findById(disciplinaId).get() : null;
        Semestre semestre = semestreRepository.findById(Semestre.SemestreId.builder()
                .ordinal(semestreOrdinal)
                .curso(curso)
                .build()).isPresent() ? semestreRepository.findById(Semestre.SemestreId.builder()
                .ordinal(semestreOrdinal)
                .curso(curso)
                .build()).get() : null;

        DisciplinasDoCurso disciplinasDoCurso = new DisciplinasDoCurso();
        disciplinasDoCurso.setCurso(curso);
        disciplinasDoCurso.setDisciplina(disciplina);
        disciplinasDoCurso.setSemestre(semestre);

        DisciplinasDoCursoRepository.save(disciplinasDoCurso);
    }

    public List<DisciplinasDoCurso> gerarCurriculo(Long cursoId) {
        Curso curso = cursoRepository.findById(cursoId).isPresent() ? cursoRepository.findById(cursoId).get() : null;
        return DisciplinasDoCursoRepository.findDisciplinasDoCursoByCurso(curso);
    }
}
