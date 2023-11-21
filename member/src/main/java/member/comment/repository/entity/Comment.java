package member.comment.repository.entity;

import jakarta.persistence.*;
import lombok.*;
import member.Member.repository.entity.Member;
import member.article.repository.entity.Article;

@Entity
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Table(name = "comment")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(columnDefinition = "TEXT", nullable = false)
    String content;

    @ManyToOne
    @JoinColumn(name = "articleId")
    private Article article;

    @ManyToOne
    @JoinColumn(name = "nickname", referencedColumnName = "nickname")
    private Member member; // 작성자
}
