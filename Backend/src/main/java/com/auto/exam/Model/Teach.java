package com.auto.exam.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "teach")
public class Teach {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "teach_id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "lecture_id")
    private Lecture lecture;

    @ManyToOne
    @JoinColumn(name = "offering_id")
    private CourseOffering courseOffering;
}
