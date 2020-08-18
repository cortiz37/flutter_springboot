package com.sample.server.service;

import com.sample.server.model.Element;
import com.sample.server.repository.ElementRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.platform.runner.JUnitPlatform;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
@RunWith(JUnitPlatform.class)
class ElementServiceTest {

    @Mock
    private ElementRepository elementRepository;

    private ElementService elementService;

    @BeforeEach
    void setUp() {
        elementService = new ElementService(elementRepository);
    }

    @Test
    void create() {
        final Element element = new Element();
        Mockito.when(elementRepository.save(Mockito.any(Element.class))).thenReturn(element);

        final Element resultant = elementService.create(element);

        assertEquals(element, resultant);
    }

    @Test
    void getById() {
        final String id = "e1";
        final Element element = new Element();
        element.setId(id);
        Mockito.when(elementRepository.getById(id)).thenReturn(Optional.of(element));

        final Optional<Element> resultant = elementService.getById(id);

        assertTrue(resultant.isPresent());
        assertEquals(element, resultant.get());
    }

    @Test
    void delete() {
        final String id = "e1";
        Mockito.when(elementRepository.delete(id)).thenReturn(true);

        boolean result = elementService.delete(id);

        assertTrue(result);
    }

    @Test
    void getAll() {
        final List<Element> database = Collections.singletonList(new Element());
        Mockito.when(elementRepository.getDatabase()).thenReturn(database);

        final List<Element> resultant = elementService.getAll();

        assertFalse(resultant.isEmpty());
    }
}