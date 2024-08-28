package com.pucminas.backendprojmatricula.dataprovider.matricula;

import com.pucminas.backendprojmatricula.model.Disciplina;
import com.pucminas.backendprojmatricula.model.Matricula;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IMatriculaRepository extends JpaRepository<Matricula, Long> {
    List<Matricula> findMatriculaByAluno(Usuario aluno);

    List<Matricula> findMatriculaByDisciplina(Disciplina disciplina);
}
