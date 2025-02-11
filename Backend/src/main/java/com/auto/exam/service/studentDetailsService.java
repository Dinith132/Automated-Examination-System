package com.auto.exam.service;

import com.auto.exam.Model.Student;
import com.auto.exam.repo.studentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class studentDetailsService {

    private final studentRepo studentRepo;

    @Autowired
    public studentDetailsService(studentRepo studentRepo){
        this.studentRepo=studentRepo;
    }

    public List<Student> get_student(){
        List<Student> st=studentRepo.findAll();
        return st;
    }
}
