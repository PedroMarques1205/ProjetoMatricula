package com.pucminas.backendprojmatricula.dataprovider.boleto;

import com.pucminas.backendprojmatricula.model.Boleto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IBoletoRepository extends JpaRepository<Boleto, Long> {
}
