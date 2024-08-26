package com.pucminas.backendprojmatricula.usecase.boleto;

import com.pucminas.backendprojmatricula.core.boleto.BoletoService;
import com.pucminas.backendprojmatricula.model.Boleto;
import com.pucminas.backendprojmatricula.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GerarBoletoUseCase {
    @Autowired
    BoletoService boletoService;

    public Boleto gerarBoleto(String matriculaAluno, Double valor){
        return boletoService.gerarBoleto(matriculaAluno, valor);
    }

}
