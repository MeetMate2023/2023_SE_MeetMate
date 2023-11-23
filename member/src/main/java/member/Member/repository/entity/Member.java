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
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private boolean company_check; // 1이면 기업, 0이면 유저
    private String uid;
    private String password;
    private String name;
    private String nickname;
    private String local;
    private String hobby;
    private int dailyPostCount;

    private LocalDateTime joinday;

    private LocalDateTime lastPostDate;
}
