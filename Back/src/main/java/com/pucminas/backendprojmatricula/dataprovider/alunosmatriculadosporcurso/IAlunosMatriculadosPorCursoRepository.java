package com.pucminas.backendprojmatricula.dataprovider.alunosmatriculadosporcurso;

import com.pucminas.backendprojmatricula.model.AlunosMatriculadosPorCurso;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IAlunosMatriculadosPorCursoRepository extends JpaRepository<AlunosMatriculadosPorCurso, Long> {
    List<AlunosMatriculadosPorCurso> findByAluno(Usuario aluno);
}
