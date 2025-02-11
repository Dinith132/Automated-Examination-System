package com.auto.exam.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "question")
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "question_id")
    private Long questionId;

    private String question;
    private Integer maks;
    private String answer;

    @ManyToOne
    @JoinColumn(name = "exam_id")
    private Exam exam;
}
