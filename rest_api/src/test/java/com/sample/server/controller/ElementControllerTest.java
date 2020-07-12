package com.sample.server.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sample.server.model.Element;
import com.sample.server.service.ElementService;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.util.Optional;

@WebMvcTest(ElementController.class)
class ElementControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockBean
    private ElementService elementService;

    @Test
    public void shouldReturnElementWhenValidIdIsProvided() throws Exception {
        final String id = "e1";
        final Element element = new Element();
        element.setId(id);
        element.setName("element 1");
        Mockito.when(elementService.getById(id)).thenReturn(Optional.of(element));

        mockMvc
            .perform(MockMvcRequestBuilders.get(String.format("/elements/%s", id)))
            .andDo(MockMvcResultHandlers.print())
            .andExpect(MockMvcResultMatchers.status().isOk())
            .andExpect(MockMvcResultMatchers.content().json(objectMapper.writeValueAsString(element)));
    }

    @Test
    public void shouldReturnNotFoundWhenInvalidIdIsProvided() throws Exception {
        final String id = "invalid-id";
        Mockito.when(elementService.getById(id)).thenReturn(Optional.empty());

        mockMvc
            .perform(MockMvcRequestBuilders.get(String.format("/elements/%s", id)))
            .andExpect(MockMvcResultMatchers.status().isNotFound());
    }
}