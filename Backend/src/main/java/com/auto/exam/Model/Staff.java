package com.auto.exam.Model;

import jakarta.persistence.*;

import static jakarta.persistence.GeneratedValue.*;

@Entity
@Table(name = "staff")
public class Staff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "staff_id")
    private Long staffId;

    private String email;
    private String nic;
    private String fullName;
    private String phoneNumber;
    private String password;
}
