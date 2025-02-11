package com.auto.exam.Model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "resitration")
public class Registration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "registration_id")
    private Long registrationId;

    @Column(name = "registration_date", nullable = false)
    private LocalDate registrationDate;

    @Column(nullable = false)
    private Integer semester;


//    @Column(nullable = false)
//    private Integer status;

    @ManyToOne
    @JoinColumn(name = "ar_id", nullable = false)
    private AR ar;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    // Constructors, getters, and setters
}
