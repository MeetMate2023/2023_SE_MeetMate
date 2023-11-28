package member.invitation.repository.entity;

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
@Table(name = "invitation")
public class Invitation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // id 필드 추가

    @ManyToOne
    @JoinColumn(name = "articleId")
    private Article article;

    @ManyToOne
    @JoinColumn(name = "sender", referencedColumnName = "nickname")
    private Member sender; // 글 작성자

    @ManyToOne
    @JoinColumn(name = "receiver", referencedColumnName = "nickname")
    private Member receiver; // 댓글 작성자

    private boolean permit;
}
