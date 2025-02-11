package com.auto.exam.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "stored_questions")
public class StoredQuestions {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "question_id")
    private Long questionId;

    private String question;
    private String answer;
    private String type;
    private int marks;

    @ManyToOne
    @JoinColumn(name = "lecture_id")
    private Lecture lecture;




}
