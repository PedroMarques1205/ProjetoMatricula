package com.pucminas.backendprojmatricula.dataprovider.usuario;

import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IUsuarioRepository extends JpaRepository<Usuario, String> {

}
