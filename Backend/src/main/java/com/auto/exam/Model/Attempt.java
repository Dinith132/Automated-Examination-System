package com.auto.exam.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "attempt")
public class Attempt {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "attempt_id")
    private Integer attemptId;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;


    @ManyToOne
    @JoinColumn(name = "exam_id")
    private Exam exam;

    private Integer marks;
    private Integer grade;
}
