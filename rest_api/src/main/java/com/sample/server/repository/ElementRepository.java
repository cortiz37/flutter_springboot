package com.sample.server.repository;

import com.sample.server.model.Element;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * In memory 'database'
 */
@Repository
public class ElementRepository {

    private final List<Element> database = new ArrayList<>();

    public Element save(Element element) {
        database.add(element);
        return element;
    }

    public Optional<Element> getById(String id) {
        return database.stream().filter(e -> id.equals(e.getId())).findFirst();
    }

    public List<Element> getDatabase() {
        return database;
    }
}