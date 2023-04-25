package fa.tranning.sondt21_jwd_assignment_03.model.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Setter
@Getter
public class Content extends AbstractAuthenticationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(length = 50, nullable = false)
    private String title;
    @Column(length = 500, nullable = false)
    private String brief;
    @Column(length = 1000, nullable = false)
    private String content;
    private String sort;
    @ManyToOne
    @JoinColumn(name = "AuthorId")
    private Member member;
}
