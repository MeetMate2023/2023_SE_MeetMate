package member.Member.repository.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.jpa.repository.Temporal;

import java.time.LocalDateTime;

@Entity
@Builder
@Setter
@Getter
@NoArgsConstructor
@Table(name = "Member")
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Member {
    @Id
    private String nickname;
    private String uid;
    private String password;
    private String name;
    private String local;
    private String hobby;
    private LocalDateTime joinday;
    private int dailyPostCount;
    private LocalDateTime lastPostDate;
    private boolean company_check; // 1이면 기업, 0이면 유저
}
