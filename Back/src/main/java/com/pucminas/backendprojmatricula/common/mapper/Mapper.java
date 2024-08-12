package com.pucminas.backendprojmatricula.common.mapper;

import lombok.AllArgsConstructor;
import org.modelmapper.ExpressionMap;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@AllArgsConstructor
@Component
public class Mapper {

    private static final ModelMapper modelMapper;

    static {
        modelMapper = new ModelMapper();
        modelMapper.getConfiguration().setAmbiguityIgnored(true);
    }

    public <S, T> S generalMapper(T input, Class<S> output) {
        return modelMapper.map(input, output);
    }

    public <S, T> List<S> mapCollection(Collection<T> input, Class<S> output) {
        return input.stream().map(element -> generalMapper(element, output)).collect(Collectors.toList());
    }

    public <S, T> void addMapping(Class<S> input, Class<T> output, ExpressionMap<S, T> expressionMap) {
        modelMapper.typeMap(input, output).addMappings(expressionMap);
    }

}
