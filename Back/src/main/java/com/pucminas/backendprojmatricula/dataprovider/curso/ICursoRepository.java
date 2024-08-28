package com.pucminas.backendprojmatricula.dataprovider.curso;

import com.pucminas.backendprojmatricula.model.Curso;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ICursoRepository extends JpaRepository<Curso, Long> {
    Curso findByNome(String nome);
}
