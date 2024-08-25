package com.pucminas.backendprojmatricula.dataprovider.disciplinasdocurso;

import com.pucminas.backendprojmatricula.model.DisciplinasDoCurso;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IDisciplinasDoCursoRepository extends JpaRepository<DisciplinasDoCurso, Long> {

}
