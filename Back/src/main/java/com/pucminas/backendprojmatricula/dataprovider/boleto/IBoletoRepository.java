package com.pucminas.backendprojmatricula.dataprovider.boleto;

import com.pucminas.backendprojmatricula.model.Boleto;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IBoletoRepository extends JpaRepository<Boleto, Long> {
    List<Boleto> findBoletoByAlunoDevedor(Usuario aluno);
}
