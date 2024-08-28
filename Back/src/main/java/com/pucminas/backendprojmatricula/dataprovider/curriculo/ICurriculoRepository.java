package com.pucminas.backendprojmatricula.dataprovider.curriculo;

import com.pucminas.backendprojmatricula.model.Curriculo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ICurriculoRepository extends JpaRepository<Curriculo, Long> {
}
