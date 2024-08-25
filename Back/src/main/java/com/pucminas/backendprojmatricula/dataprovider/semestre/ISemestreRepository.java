package com.pucminas.backendprojmatricula.dataprovider.semestre;

import org.springframework.data.jpa.repository.JpaRepository;
import com.pucminas.backendprojmatricula.model.Semestre;
import org.springframework.stereotype.Repository;

@Repository
public interface ISemestreRepository extends JpaRepository<Semestre, Semestre.SemestreId>{

}
