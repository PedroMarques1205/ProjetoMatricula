package com.pucminas.backendprojmatricula.usecase.boleto;

import com.pucminas.backendprojmatricula.core.boleto.BoletoService;
import com.pucminas.backendprojmatricula.model.Boleto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ObterBoletoUseCase {
    @Autowired
    BoletoService boletoService;

    public List<Boleto> obterBoletosPorAluno(String matricula) {
        return boletoService.obterBoletosPorAluno(matricula);
    }
}
