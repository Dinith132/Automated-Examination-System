package com.auto.exam.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "lecture")
public class Lecture {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lecture_id")
    private Long lectureId;

    @OneToOne
    @JoinColumn(name = "satff_id")
    private Staff staff;

    @ManyToOne
    @JoinColumn(name = "department_id")
    private Department department;
}
