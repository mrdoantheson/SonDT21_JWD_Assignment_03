package fa.tranning.sondt21_jwd_assignment_03.model.entity;

import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Setter
@Getter
@MappedSuperclass
public abstract class AbstractAuthenticationEntity {
    private LocalDateTime createDate;
    private LocalDateTime updateTime;
}
