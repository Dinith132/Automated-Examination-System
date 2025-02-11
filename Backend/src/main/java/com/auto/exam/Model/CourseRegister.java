package com.auto.exam.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "course_register")
public class CourseRegister {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "course_registration_id")
    private Integer courseRegistrationID;

    @ManyToOne
    @JoinColumn(name = "registration_id", nullable = false)
    private Registration registration;

    @ManyToOne
    @JoinColumn(name = "offering_id", nullable = false)
    private CourseOffering offering;
}
