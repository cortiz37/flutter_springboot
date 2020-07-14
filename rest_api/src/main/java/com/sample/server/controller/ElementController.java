package com.sample.server.controller;

import com.sample.server.model.Element;
import com.sample.server.service.ElementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.Optional;

@Controller
@RequestMapping("/elements")
public class ElementController {

    private static final String LABEL = "Access";

    private final ElementService elementService;

    @Autowired
    public ElementController(ElementService elementService) {
        this.elementService = elementService;
    }

    @GetMapping("/")
    public ResponseEntity getAll() {
        return ResponseEntity.ok(elementService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity getById(@PathVariable(name = "id") String id) {
        final Optional<Element> element = elementService.getById(id);
        return element.isPresent() ? ResponseEntity.ok(element.get()) : ResponseEntity.notFound().build();
    }

    @PostMapping("/")
    public ResponseEntity create(@RequestBody Element element) {
        Element saved = elementService.create(element);
        return ResponseEntity.created(URI.create("/${saved.id}")).build();
    }
}