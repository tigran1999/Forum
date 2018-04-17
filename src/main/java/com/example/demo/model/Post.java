package com.example.demo.model;

import com.example.demo.model.Category;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "post")
@Builder
public class Post  {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    private int id;
    @NotEmpty
    @Column
    private String title;
    @NotEmpty
    @Column
    private String text;
    @NotNull
    @ManyToOne
    private Category category;
    @ManyToOne
    private User user;
    @Column(name = "pic_url")
    private String picUrl;
    @Column
    private String timestamp;
    @Transient
    private int commentCount;
    @Transient
    private int viewCount;
}
