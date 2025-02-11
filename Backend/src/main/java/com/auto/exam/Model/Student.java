package com.auto.exam.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "student")
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_id")
    private Long studentId;

    private String email;
    private String fullName;
    private String nic;
    private String nationality;
    private String photoLink;
    private String address;
    private String gender;
    private String phoneNo;
    private String password;

    @ManyToOne
    @JoinColumn(name = "departmnet_id")
    private Department department;

    @ManyToOne
    @JoinColumn(name = "lecture_id")
    private Lecture lecture;
}
