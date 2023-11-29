package member.meeting.repository.entity;

import jakarta.persistence.*;
import lombok.*;
import member.Member.repository.entity.Member;
import member.article.repository.entity.Article;

@Entity
@Builder
@Getter
@NoArgsConstructor
@Table(name = "Meeting")

@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Meeting {
    //id, nickname, title, meetTime, location, category, chat
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "articleId")
    private Article article;

    @ManyToOne
    @JoinColumn(name = "nickname", referencedColumnName = "nickname")
    private Member member;
//
//    @ManyToOne
//    @JoinColumn(name = "title", referencedColumnName = "title")
//    private Article title;
//
//    @ManyToOne
//    @JoinColumn(name = "meettime", referencedColumnName = "meetTime")
//    private Article meetTime;
//
//    @ManyToOne
//    @JoinColumn(name = "location", referencedColumnName = "location")
//    private Article location;



}
