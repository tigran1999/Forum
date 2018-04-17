package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name="user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private int id;
    @NotEmpty
    @Column
    private String name;
    @NotEmpty
    @Column
    private String surname;
    @NotEmpty
    @Column
    private String email;
    @NotEmpty
    @Column
    private String password;
    @Column(name = "pic_url")
    private String picUrl;
    @Column(name = "user_type")
    @Enumerated(value = EnumType.STRING)
    private UserType type;
    @Column
    private boolean verify;
    @Column
    private String token;


}
