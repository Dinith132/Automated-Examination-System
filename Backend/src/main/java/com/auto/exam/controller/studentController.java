package com.auto.exam.controller;

import com.auto.exam.Model.*;
import com.auto.exam.repo.userRepo;
import com.auto.exam.service.studentDetailsService;
import com.auto.exam.service.examService;
import org.aspectj.weaver.patterns.TypePatternQuestions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/student")
public class studentController {

    private final studentDetailsService studentDetailsService;
    private final examService examService;

    @Autowired
    public studentController(studentDetailsService studentDetailsService, examService examService) {
        this.studentDetailsService = studentDetailsService;
        this.examService = examService;
    }

    @Autowired
    private userRepo userRepo;


    @GetMapping("/getall")
    public ResponseEntity<List<Student>> getStudents(){
        System.out.println(SecurityContextHolder.getContext().getAuthentication().getName()+"---------------------------");
        List<Student> st = studentDetailsService.get_student();
        return new ResponseEntity<>(st, HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<Student> addStudent(@RequestBody Student student) {
        Student newStudent = studentDetailsService.save_student(student);
        System.out.println(newStudent.toString());
        return new ResponseEntity<>(newStudent, HttpStatus.CREATED);
    }

    @GetMapping("/profile")
    public  User getUserProfile() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        return userRepo.findByUsername(username);
    }

    @PostMapping("/getexams")
    public ResponseEntity<List<Exam>> getExamsOnDate(String date){
        List<Exam> ex=examService.getExamsUsingDate(date);
        for(Exam x:ex){
            System.out.println(x.toString());
            System.out.println("**************************");
        }
        return new ResponseEntity<>(ex, HttpStatus.OK);
    }
    //registration process of student for the exam
    @PostMapping("/register")
    public ResponseEntity<Exam> getExamsOnDate(@RequestBody Student student){
        return null;
    }
    @PostMapping("/exam/{ExamID}")
    public List<ProvideQuestion> examQuestions(@PathVariable long ExamID){
        return examService.getQuestions(ExamID);
    }


    @PostMapping("/exam/{ExamID}/submit")
    public List<MarkQuestions> markQuestions(@RequestBody List<MarkQuestions> markQuestions){
        return examService.markQuestions(markQuestions);
    }
}
