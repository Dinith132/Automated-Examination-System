package com.auto.exam.controller;

import com.auto.exam.Model.Student;
import com.auto.exam.service.studentDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class studenController {
    private final studentDetailsService studentDetailsService;

    @Autowired
    public studenController(com.auto.exam.service.studentDetailsService studentDetailsService) {
        this.studentDetailsService = studentDetailsService;
    }

    @GetMapping("/getall")
    public ResponseEntity<List<Student>> getStudents(){
        List<Student> st=studentDetailsService.get_student();
        return new ResponseEntity<>(st,HttpStatus.OK);
    }
}
