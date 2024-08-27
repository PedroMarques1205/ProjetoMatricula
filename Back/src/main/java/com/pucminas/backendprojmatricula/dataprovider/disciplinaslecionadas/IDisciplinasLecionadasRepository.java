package com.pucminas.backendprojmatricula.dataprovider.disciplinaslecionadas;

import com.pucminas.backendprojmatricula.model.DisciplinasLecionadas;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IDisciplinasLecionadasRepository extends JpaRepository<DisciplinasLecionadas, Long> {

    List<DisciplinasLecionadas> findByProfessorDaDisciplina(Usuario professor);
}
