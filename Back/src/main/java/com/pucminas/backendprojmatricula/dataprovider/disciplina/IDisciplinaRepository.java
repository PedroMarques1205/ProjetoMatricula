package com.pucminas.backendprojmatricula.dataprovider.disciplina;

import com.pucminas.backendprojmatricula.model.Disciplina;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IDisciplinaRepository extends JpaRepository<Disciplina, Long> {
    Disciplina findByNome(String nome);
}
