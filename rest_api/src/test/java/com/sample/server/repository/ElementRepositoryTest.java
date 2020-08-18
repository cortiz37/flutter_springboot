package com.sample.server.repository;

import com.sample.server.model.Element;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

class ElementRepositoryTest {

    private final String id = "e1";
    private ElementRepository elementRepository;

    @BeforeEach
    void setUp() {
        elementRepository = new ElementRepository();
        Element element = new Element();
        element.setId(id);
        elementRepository.save(element);
    }

    @Test
    void save() {
        Element element = new Element();
        element.setId("e2");
        final int listSize = elementRepository.getDatabase().size();

        String createdId = elementRepository.save(element).getId();

        assertEquals(element.getId(), createdId);
        assertEquals(listSize + 1, elementRepository.getDatabase().size());
    }

    @Test
    void delete() {
        Element element = new Element();
        element.setId("tbd");
        elementRepository.save(element);

        boolean result = elementRepository.delete(element.getId());

        assertTrue(result);
    }

    @Test
    void getById() {
        Optional<Element> element = elementRepository.getById(id);

        assertTrue(element.isPresent());
        assertEquals(id, element.get().getId());
    }

    @Test
    void getDatabase() {
        final List<Element> database = elementRepository.getDatabase();

        assertNotNull(database);
        assertFalse(database.isEmpty());
    }
}