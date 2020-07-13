package com.sample.server;

import com.sample.server.controller.ElementController;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
class ApplicationTest {

    @Autowired
    private ElementController elementController;

    @Test
    public void contextInitialized() throws Exception {
        assertNotNull(elementController);
    }
}