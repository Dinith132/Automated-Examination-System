package com.auto.exam.controller;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import com.auto.exam.Dto.CoursesForLecture;
import com.auto.exam.Dto.ExamReportAll;
import com.auto.exam.Dto.Examevent;
import com.auto.exam.Model.SendingExam;
import com.auto.exam.service.courseService;
import com.auto.exam.service.examService;
import com.auto.exam.service.ollamaService;
import com.auto.exam.service.questionService;
import com.auto.exam.repo.courseOfferingRepo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

@RunWith(SpringRunner.class)
@WebMvcTest(lecturerController.class)
public class LecturerControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean private examService      examService;
    @MockBean private courseService    courseService;
    @MockBean private courseOfferingRepo courseOfferingRepo;
    @MockBean private questionService  questionService;
    @MockBean private ollamaService    ollamaService;

    @Test
    public void testGetExamsByDate() throws Exception {
        when(examService.getExamsUsingDateAndLecture(any()))
                .thenReturn(new ArrayList<SendingExam>());

        mockMvc.perform(post("/lecturer/getExamsByDate")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"date\":\"2025-06-01 09:00:00\"}"))
                .andExpect(status().isOk())
                .andExpect(content().json("[]"));
    }

    @Test
    public void testGetCourses() throws Exception {
        when(courseService.getCourses())
                .thenReturn(Collections.singletonList(new CoursesForLecture()));

        mockMvc.perform(get("/lecturer/getCourses"))
                .andExpect(status().isOk())
                .andExpect(content().json("[{}]"));
    }

    @Test
    public void testAddExam() throws Exception {
        when(examService.addExam(any())).thenReturn(1L);

        String payload = "{"
                + "\"startDateTime\":\"2023-10-01T12:00:00\","
                + "\"duration\":120,"
                + "\"passingCriteria\":2,"
                + "\"type\":1,"
                + "\"totalMarks\":100,"
                + "\"courseOfferingId\":7,"
                + "\"questions\":["
                +   "{\"question\":\"What is the capital of France?\",\"marks\":5,"
                +    "\"answer\":\"Paris\",\"questionType\":1,"
                +    "\"mcqOptionsList\":["
                +      "{\"optionText\":\"Paris\",\"location\":1,\"isCorrect\":true}"
                +    "]}"
                + "]"
                + "}";

        mockMvc.perform(post("/lecturer/addExam")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(payload))
                .andExpect(status().isCreated())
                .andExpect(content().string("1"));
    }

    @Test
    public void testAddQuestions() throws Exception {
        when(questionService.addQuestions(any()))
                .thenReturn(Collections.singletonList(1L));

        String payload = "{"
                + "\"examId\":32,"
                + "\"questions\":["
                +   "{\"question\":\"What is the capital of France?\",\"marks\":5,\"answer\":\"Paris\"},"
                +   "{\"question\":\"Solve: 5 + 3\",\"marks\":2,\"answer\":\"8\"}"
                + "]"
                + "}";

        mockMvc.perform(post("/lecturer/addQuestions")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(payload))
                .andExpect(status().isCreated())
                .andExpect(content().json("[1]"));
    }

    @Test
    public void testGenerateExamAi() throws Exception {
        when(ollamaService.generateQuestions(any()))
                .thenReturn("generatedExamId");

        mockMvc.perform(post("/lecturer/generateExamAi")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"foo\":\"bar\"}"))
                .andExpect(status().isCreated())
                .andExpect(content().string("generatedExamId"));
    }

    @Test
    public void testGetExamReport() throws Exception {
        when(examService.getReports(any()))
                .thenReturn(new ArrayList<ExamReportAll>());

        mockMvc.perform(post("/lecturer/getExamReport")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"examId\":1}"))
                .andExpect(status().isOk())
                .andExpect(content().json("[]"));
    }

    @Test
    public void testGetAllExam() throws Exception {
        when(examService.getAllExamEvents())
                .thenReturn(new Examevent());

        mockMvc.perform(post("/lecturer/getAllExam")
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());
    }
}
