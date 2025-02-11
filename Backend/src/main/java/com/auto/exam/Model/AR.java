package com.auto.exam.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "ar")
public class AR {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ar_id")
    private Long arId;

    @OneToOne
    @JoinColumn(name = "staff_id")
    private Staff staff;
}
