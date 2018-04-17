package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "category")
public class Category {

        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        @Column
        private int id;
        @NotEmpty
        @Column
        private String name;

    }
