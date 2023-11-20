package member.article.repository.entity;

import jakarta.persistence.*;
import lombok.*;
import member.comment.repository.entity.Comment;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Article {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String content;
    private String nickname;
    private String category;
    private String location;
    private LocalDateTime upload_time;
    private String chat;


}
