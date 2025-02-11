package com.auto.exam.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "admin_cordinator")
public class AdminCordinator {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "admin_cordinater_id")
    private Long adminCordinatorId;

    @OneToOne
    @JoinColumn(name = "staff_id", referencedColumnName = "staff_id")
    private Staff staff;
}