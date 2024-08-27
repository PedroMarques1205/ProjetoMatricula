package com.pucminas.backendprojmatricula.core.boleto;

import com.pucminas.backendprojmatricula.dataprovider.boleto.IBoletoRepository;
import com.pucminas.backendprojmatricula.dataprovider.usuario.IUsuarioRepository;
import com.pucminas.backendprojmatricula.model.Boleto;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class BoletoService {

    @Autowired
    IBoletoRepository boletoRepository;

    @Autowired
    IUsuarioRepository usuarioRepository;

    public Boleto gerarBoleto(String matriculaAluno, Double valor){
        Boleto boleto = new Boleto();
        Usuario aluno = usuarioRepository.getReferenceById(matriculaAluno);
        boleto.setAlunoDevedor(aluno);
        boleto.setDataValidade(LocalDateTime.now().plusWeeks(4));
        boleto.setValor(valor);
        return boletoRepository.save(boleto);
    }

    public List<Boleto> obterBoletosPorAluno(String matriculaAluno){
        Usuario aluno = usuarioRepository.getReferenceById(matriculaAluno);
        return boletoRepository.findBoletoByAlunoDevedor(aluno);
    }
}
