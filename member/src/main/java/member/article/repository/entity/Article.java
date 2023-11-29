package member.article.repository.entity;

import jakarta.persistence.*;
import lombok.*;
import member.Member.repository.entity.Member;
import member.comment.repository.entity.Comment;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Builder
@Getter
@Setter
@NoArgsConstructor
@Table(name = "Article")
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String content;

    @ManyToOne
    @JoinColumn(name = "nickname", referencedColumnName = "nickname")
    private Member nickname;

    private String category;
    private String location;
    private String meetTime;
    private LocalDateTime upload_time;

    private String chat;


}
