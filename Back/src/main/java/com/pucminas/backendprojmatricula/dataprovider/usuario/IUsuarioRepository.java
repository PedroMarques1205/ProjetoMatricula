package com.pucminas.backendprojmatricula.dataprovider.usuario;

import com.pucminas.backendprojmatricula.common.enums.TipoUsuario;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUsuarioRepository extends JpaRepository<Usuario, String> {
    List<Usuario> findByTipoAcesso(TipoUsuario tipoUsuario);


}
