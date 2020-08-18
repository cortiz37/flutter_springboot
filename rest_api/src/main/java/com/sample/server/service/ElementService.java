package com.sample.server.service;

import com.sample.server.model.Element;
import com.sample.server.repository.ElementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ElementService {

    private final ElementRepository elementRepository;

    @Autowired
    public ElementService(ElementRepository elementRepository) {
        this.elementRepository = elementRepository;
    }

    public Element create(Element element) {
        element.setId(UUID.randomUUID().toString());
        return elementRepository.save(element);
    }

    public Optional<Element> getById(String id) {
        return elementRepository.getById(id);
    }

    public boolean delete(String id) {
        return elementRepository.delete(id);
    }

    public List<Element> getAll() {
        return elementRepository.getDatabase();
    }
}