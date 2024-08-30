package com.pucminas.backendprojmatricula.dataprovider.disciplinasdocurso;

import com.pucminas.backendprojmatricula.model.Curso;
import com.pucminas.backendprojmatricula.model.DisciplinasDoCurso;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IDisciplinasDoCursoRepository extends JpaRepository<DisciplinasDoCurso, Long> {

    List<DisciplinasDoCurso> findDisciplinasDoCursoByCurso(Curso curso);

}
