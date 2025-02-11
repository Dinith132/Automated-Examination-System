package com.auto.exam.Model;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "course_offering")
public class CourseOffering {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "offering_id")
    private Long offeringId;

    private Integer semester;
    private LocalDate startDate;
    private LocalDate endDate;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @ManyToOne
    @JoinColumn(name = "admin_cordinate_id")
    private AdminCordinator adminCordinator;

    @ManyToOne
    @JoinColumn(name = "lecture_id")
    private Lecture lecture;
}
